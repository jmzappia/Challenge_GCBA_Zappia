/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.Linq;
using System.IO;
using System.IO.Packaging;
using System.Management.Automation;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Set-OpenXmlTheme cmdlet
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "OpenXmlTheme", SupportsShouldProcess = true)]
    public class SetOpenXmlThemeCmdlet : OpenXmlCmdlet
    {
        #region Member definitions and Properties

        private bool passThru = false;
        private string themePath;
        private Package themePackage;

        /// <summary>
        /// ThemePath parameter
        /// </summary>
        [Parameter(Position = 1,
            Mandatory = false,
            HelpMessage = "Theme path")]
        [ValidateNotNullOrEmpty]
        public string ThemePath
        {
            set
            {
                themePath = SessionState.AllMatchingFiles(value).First();
            }
        }

        /// <summary>
        /// ThemePackage parameter
        /// </summary>
        [Parameter(Position = 2,
           Mandatory = false,
           ValueFromPipeline = true,
           HelpMessage = "Theme path")]
        [ValidateNotNullOrEmpty]
        public Package ThemePackage
        {
            set
            {
                themePackage = value;
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
                if (themePath != null)
                    themePackage = Package.Open(themePath);
                if (themePackage == null)
                {
                    WriteError(new ErrorRecord(new Exception("No theme was specified."), "BadParameters", ErrorCategory.InvalidArgument, null));
                }
                else
                {
                    foreach (var document in AllDocuments("Set-OpenXmlTheme", FileAccess.ReadWrite))
                    {
                        try
                        {
                            document.SetTheme(themePackage);
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
                if (themePath != null)
                    themePackage.Close();
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