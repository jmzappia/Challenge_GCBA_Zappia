/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.Linq;
using System.Xml.Linq;
using System.IO;
using System.IO.Packaging;
using System.Management.Automation;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Set-OpenXmlContentStyle cmdlet
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "OpenXmlContentStyle", SupportsShouldProcess = true)]
    public class SetOpenXmlContentStyle :OpenXmlCmdlet
    {
        #region Member definitions and Parameters

        private bool passThru = false;
        private string xpathInsertionPoint;
        private string stylesSourcePath;
        private XDocument stylesSource;
        private string styleName;

        /// <summary>
        /// InsertionPoint parameter
        /// </summary>
        [Parameter(Position = 2,
            Mandatory = true,
            HelpMessage = "Insertion point location")]
        [ValidateNotNullOrEmpty]
        public string InsertionPoint
        {
            get
            {
                return xpathInsertionPoint;
            }
            set
            {
                xpathInsertionPoint = value;
            }
        }

        /// <summary>
        /// StyleName parameter
        /// </summary>
        [Parameter(Position = 3,
            Mandatory = true,
            HelpMessage = "Style name")]
        [ValidateNotNullOrEmpty]
        public string StyleName
        {
            get
            {
                return styleName;
            }
            set
            {
                styleName = value;
            }
        }

        /// <summary>
        /// StylesSourcePath parameter
        /// </summary>
        [Parameter(Position = 4,
            Mandatory = false,
            HelpMessage = "Style file path")]
        [ValidateNotNullOrEmpty]
        public string StylesSourcePath
        {
            get
            {
                return stylesSourcePath;
            }
            set
            {
                stylesSourcePath = SessionState.AllMatchingFiles(value).First();
            }
        }

        /// <summary>
        /// StylesSource parameter
        /// </summary>
        [Parameter(Position = 5,
            Mandatory = false,
            ValueFromPipeline = true,
            HelpMessage = "Styles from XDocument")]
        [ValidateNotNullOrEmpty]
        public XDocument StylesSource
        {
            get
            {
                return stylesSource;
            }
            set
            {
                stylesSource = value;
            }
        }

        /// <summary>
        /// SuppressBackups parameter
        /// </summary>
        [Parameter(Position = 6,
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
            Position = 7,
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
                if (stylesSourcePath != null)
                    stylesSource = XDocument.Load(stylesSourcePath);
                if (stylesSource == null)
                {
                    WriteError(new ErrorRecord(new Exception("No styles source was specified."), "BadParameters", ErrorCategory.InvalidArgument, null));
                }
                else
                {
                    foreach (var document in AllDocuments("Set-OpenXmlContentStyle", FileAccess.ReadWrite))
                    {
                        try
                        {
                            document.InsertStyle(xpathInsertionPoint, styleName, stylesSource);
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