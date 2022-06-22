/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.IO;
using System.Collections.ObjectModel;
using System.Management.Automation;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Get-OpenXmlBackground cmdlet
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "OpenXmlBackground")]
    public class GetOpenXmlBackgroundCmdlet : OpenXmlCmdlet
    {
        #region Member definitions and Parameters

        private bool backgroundColor;
        private bool backgroundImage;

        /// <summary>
        /// Image parameter
        /// </summary>
        [Parameter(
            Position = 1,
           Mandatory = false,
           HelpMessage = "Gets the image from the background.")
        ]
        [ValidateNotNullOrEmpty]
        public SwitchParameter Image
        {
            get
            {
                return backgroundImage;
            }
            set
            {
                backgroundImage = value;
            }
        }

        /// <summary>
        /// Color parameter
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = false,
            HelpMessage = "Gets the color of the background (hexadecimal format)")
        ]
        [ValidateNotNullOrEmpty]
        public SwitchParameter Color
        {
            get
            {
                return backgroundColor;
            }
            set
            {
                backgroundColor = value;
            }
        }

        #endregion

        #region Cmdlet operations

        /// <summary>
        /// Entry point for PowerShell cmdlets
        /// </summary>
        protected override void ProcessRecord()
        {
            // At least one of the backgroundColor or backgroundImage parameters has to be set it
            if (backgroundColor || backgroundImage)
            {
                try
                {
                    foreach (var document in AllDocuments("Get-OpenXmlBackground", FileAccess.Read))
                    {
                        try
                        {
                            string bgColor = string.Empty;
                            string bgImagePath = string.Empty;
                            if (backgroundColor == true)
                            {
                                bgColor = document.GetBackgroundColor();
                                if (bgColor != "")
                                    WriteObject(System.Drawing.Color.FromArgb(Convert.ToInt32(bgColor, 16)), true);
                            }
                            else if (backgroundImage == true)
                            {
                                string filename = document.GetBackgroundImage();
                                if (filename != "")
                                {
                                    System.IO.FileInfo fileInfo = new System.IO.FileInfo(document.GetBackgroundImage());
                                    WriteObject(fileInfo, true);
                                }
                            }
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
            else
            {
                WriteError(new ErrorRecord(new Exception("Requires one of the two parameters Color or Image."), "BadParameters", ErrorCategory.InvalidArgument, null));
            }
        }

        #endregion
    }
}
