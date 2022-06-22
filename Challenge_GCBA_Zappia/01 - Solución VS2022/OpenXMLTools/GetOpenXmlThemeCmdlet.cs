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
    /// Get-OpenXmlTheme cmdlet
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "OpenXmlTheme")]
    public class GetOpenXmlThemeCmdlet : OpenXmlCmdlet
    {
        #region Member definitions and Parameters
        
        private string outputPath;

        /// <summary>
        /// OutputPath parameter
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = true,
            HelpMessage = "Output path")
        ]
        [ValidateNotNullOrEmpty]
        public string OutputPath
        {
            set
            {
                outputPath = System.IO.Path.Combine(SessionState.Path.CurrentLocation.Path, value);
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
                foreach (var document in AllDocuments("Get-OpenXmlTheme", FileAccess.Read))
                {
                    try
                    {
                        Package theme = document.GetTheme(outputPath);
                        WriteObject(theme, true);
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