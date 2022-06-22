/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using System.Collections.ObjectModel;
using System.Management.Automation;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Set the style.xml of a word document
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "OpenXmlStyle", SupportsShouldProcess = true)]
    public class SetOpenXmlStyleCmdlet : OpenXmlCmdlet
    {
        #region Member definitions and Parameters

        private bool passThru = false;
        private string styleFile;
        private XDocument stylesDocument;

        /// <summary>
        /// StylePath parameter
        /// </summary>
        [Parameter(Position = 1,
           Mandatory = false,
           HelpMessage = "New Style.xml path")
        ]
        [ValidateNotNullOrEmpty]
        public string StylePath
        {
            get
            {
                return styleFile;
            }
            set
            {
                styleFile = SessionState.AllMatchingFiles(value).First();
            }
        }

        /// <summary>
        /// Style parameter
        /// </summary>
        [Parameter(Position = 2,
           Mandatory = false,
           ValueFromPipeline = true,
           HelpMessage = "New styles document")
        ]
        [ValidateNotNullOrEmpty]
        public XDocument Style
        {
            get
            {
                return stylesDocument;
            }
            set
            {
                stylesDocument = value;
            }
        }

        /// <summary>
        /// SuppressBackups parameter
        /// </summary>
        [Parameter(Position = 3,
           Mandatory = false,
           HelpMessage = "Use this switch to avoid generating backups for processed files")
        ]
        [ValidateNotNullOrEmpty]
        public SwitchParameter SuppressBackups
        {
            get
            {
                return suppressBackups;
            }
            set
            {
                suppressBackups = value;
            }
        }

        /// <summary>
        /// PassThru parameter
        /// </summary>
        [Parameter(
            Position = 4,
            Mandatory = false,
            HelpMessage = "Use this switch to pipe out the processed document.")
        ]
        [ValidateNotNullOrEmpty]
        public SwitchParameter PassThru
        {
            get
            {
                return passThru;
            }
            set
            {
                passThru = value;
            }
        }

        #endregion

        #region Cmdlet operations

        /// <summary>
        /// Entry point for PowerShell cmdlets
        /// </summary>
        protected override void ProcessRecord()
        {
            try
            {
                if (styleFile != null)
                    stylesDocument = XDocument.Load(styleFile);
                if (stylesDocument == null)
                {
                    WriteError(new ErrorRecord(new Exception("No styles document was specified."), "BadParameters", ErrorCategory.InvalidArgument, null));
                }
                else
                {
                    foreach (var document in AllDocuments("Set-OpenXmlStyle", FileAccess.ReadWrite))
                    {
                        try
                        {
                            document.SetStylePart(stylesDocument);
                            document.FlushParts();
                            if (passThru)
                                WriteObject(document.Document, true);
                            else
                                document.Close();
                        }
                        catch (ItemNotFoundException e)
                        {
                            WriteError(new ErrorRecord(e, "FileNotFound", ErrorCategory.OpenError, null));
                            document.Close();
                        }
                        catch (InvalidOperationException e)
                        {
                            WriteError(new ErrorRecord(e, "InvalidOperation", ErrorCategory.InvalidOperation, null));
                            document.Close();
                        }
                        catch (ArgumentException e)
                        {
                            WriteError(new ErrorRecord(e, "InvalidArgument", ErrorCategory.InvalidArgument, null));
                            document.Close();
                        }
                        catch (Exception e)
                        {
                            WriteError(new ErrorRecord(e, "General", ErrorCategory.NotSpecified, null));
                            document.Close();
                        }
                    }
                }
            }
            catch (ItemNotFoundException e)
            {
                WriteError(new ErrorRecord(e, "FileNotFound", ErrorCategory.OpenError, null));
            }
            catch (InvalidOperationException e)
            {
                WriteError(new ErrorRecord(e, "InvalidOperation", ErrorCategory.InvalidOperation, null));
            }
            catch (ArgumentException e)
            {
                WriteError(new ErrorRecord(e, "InvalidArgument", ErrorCategory.InvalidArgument, null));
            }
            catch (Exception e)
            {
                WriteError(new ErrorRecord(e, "General", ErrorCategory.NotSpecified, null));
            }
        }
        #endregion
    }
}
