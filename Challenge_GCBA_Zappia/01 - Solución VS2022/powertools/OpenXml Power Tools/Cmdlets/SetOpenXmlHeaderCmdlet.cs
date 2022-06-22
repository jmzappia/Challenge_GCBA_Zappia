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
using OpenXml.PowerTools.Wordprocessing;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Set the header files of a word document
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "OpenXmlHeader", SupportsShouldProcess = true)]
    public class SetOpenXmlHeaderCmdlet : OpenXmlCmdlet
    {

        #region Member definitions and Parameters

        private bool passThru = false;
        private string headerPath;
        private XDocument header;
        private HeaderType kind;

        /// <summary>
        /// HeaderType parameter
        /// </summary>
        [Parameter(Position = 1,
           Mandatory = true,
           HelpMessage = "Specify the kind of the header to extract")
        ]
        public HeaderType HeaderType
        {
            get
            {
                return kind;
            }
            set
            {
                kind = value;
            }
        }

        /// <summary>
        /// Header parameter
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = false,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "XDocument of the header to add")
        ]
        [ValidateNotNullOrEmpty]
        public XDocument Header
        {
            get
            {
                return header;
            }
            set
            {
                header = value;
            }
        }

        /// <summary>
        /// Paths of all the header to add in the document
        /// </summary>
        [Parameter(Position = 3,
           Mandatory = false,
           HelpMessage = "The path of the header to add in the document")
        ]
        [ValidateNotNullOrEmpty]
        public string HeaderPath
        {
            get
            {
                return headerPath;
            }
            set
            {
                headerPath = SessionState.AllMatchingFiles(value).First();
            }
        }

        /// <summary>
        /// Use this switch to avoid generating backups for processed files
        /// </summary>
        [Parameter(Position = 4,
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
            Position = 5,
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
                if (headerPath != null)
                    header = XDocument.Load(headerPath);
                if (header == null)
                {
                    WriteError(new ErrorRecord(new Exception("No header was specified."), "BadParameters", ErrorCategory.InvalidArgument, null));
                }
                else
                {
                    foreach (var document in AllDocuments("Set-OpenXmlContentFormat", FileAccess.ReadWrite))
                    {
                        try
                        {
                            document.SetHeader(header, kind);
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
