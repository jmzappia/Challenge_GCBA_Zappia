/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.IO;
using System.Linq;
using System.Collections.ObjectModel;
using System.Management.Automation;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;
using OpenXml.PowerTools;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Add-OpenXmlIndex cmdlet
    /// </summary>
    [Cmdlet(VerbsCommon.Add, "OpenXmlDocumentIndex", SupportsShouldProcess = true)]
    public class AddOpenXmlDocumentIndexCmdlet : OpenXmlCmdlet
    {
        #region Member definitions and Parameters

        private bool passThru = false;
        string stylesSourcePath = "";
        bool addDefaultStyles = false;

        /// <summary>
        /// Specify the StylesSourcePath parameter
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = false,
            HelpMessage = "Path of the styles file used to get the styles of the index")
        ]
        [ValidateNotNullOrEmpty]
        public string StylesSourcePath
        {
            get
            {
                return stylesSourcePath;
            }
            set
            {
                stylesSourcePath = value;
            }
        }

        /// <summary>
        /// Specify the AddDefaultStyles parameter
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = false,
            HelpMessage = "Specifies if the styles used in the index, must be added to the document")
        ]
        [ValidateNotNullOrEmpty]
        public SwitchParameter AddDefaultStyles
        {
            get
            {
                return addDefaultStyles;
            }
            set
            {
                addDefaultStyles = value;
            }
        }

        /// <summary>
        /// Specify the SuppressBackups parameter
        /// </summary>
        [Parameter(
            Position = 3,
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
        /// Specify the PassThru parameter
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
                foreach (var document in AllDocuments("Add-OpenXmlDocumentIndex", FileAccess.ReadWrite))
                {
                    try
                    {
                        document.GenerateIndex(stylesSourcePath, addDefaultStyles);
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
