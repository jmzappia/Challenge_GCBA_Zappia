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

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Set-OpenXmlBackground cmdlet
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "OpenXmlBackground", SupportsShouldProcess = true)]
    public class SetOpenXmlBackgroundCmdlet : OpenXmlCmdlet
    {
        #region Member definitions and Parameters

        private bool passThru = false;
        private string backgroundColor;
        private string backgroundImagePath;

        /// <summary>
        /// ImagePath parameter
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = false,
            HelpMessage = "Path of image to set as document background")
        ]
        [ValidateNotNullOrEmpty]
        public string ImagePath
        {
            get
            {
                return backgroundImagePath;
            }
            set
            {
                backgroundImagePath = SessionState.AllMatchingFiles(value).First();
            }
        }

        /// <summary>
        /// ColorName parameter
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = false,
            HelpMessage = "Color code (hexadecimal) to set as the document background")
        ]
        [ValidateNotNullOrEmpty]
        public string ColorName
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

        /// <summary>
        /// Color parameter
        /// </summary>
        [Parameter(
            Position = 3,
            Mandatory = false,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "Color object to set as the document background")
        ]
        [ValidateNotNullOrEmpty]
        public System.Drawing.Color Color
        {
            get
            {
                return System.Drawing.Color.FromArgb(backgroundColor == null ? 0 : Convert.ToInt32(backgroundColor,16));
            }
            set
            {
                backgroundColor = String.Format("{0:X2}{1:X2}{2:X2}", value.R, value.G, value.B);
            }
        }

        /// <summary>
        /// ImageFile parameter
        /// </summary>
        [Parameter(
            Position = 4,
            Mandatory = false,
            ValueFromPipeline = true,
            HelpMessage = "Image object to use as document background")
        ]
        [ValidateNotNullOrEmpty]
        public System.IO.FileInfo ImageFile
        {
            get
            {
                return new System.IO.FileInfo(backgroundImagePath == null ? "." : backgroundImagePath);
            }
            set
            {
                backgroundImagePath = value.FullName;
            }
        }

        /// <summary>
        /// SuppressBackups parameter
        /// </summary>
        [Parameter(
            Position = 5,
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
            Position = 6,
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
                // If an image was piped in, the background color string will not be valid.
                if (backgroundImagePath != null)
                    backgroundColor = null;

                // At least one of the backgroundColor or backgroundImage parameters must be set it
                if (backgroundColor == null && backgroundImagePath == null)
                {
                    WriteError(new ErrorRecord(new Exception("Requires at least one of the three parameters: Color, Image or ImagePath."), "BadParameters", ErrorCategory.InvalidArgument, null));
                }
                else
                {
                    foreach (var document in AllDocuments("Set-OpenXmlBackground", FileAccess.ReadWrite))
                    {
                        try
                        {
                            SetBackground(document);
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
                        catch (OutOfMemoryException)
                        {
                            WriteError(new ErrorRecord(new ArgumentException("Invalid picture file."), "InvalidArgument", ErrorCategory.InvalidArgument, null));
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

        #region Implementation

        /// <summary>
        /// Sets the background color or image of the given OpenXml document
        /// </summary>
        /// <param name="document">OpenXml package to set the background</param>
        private void SetBackground(OpenXmlDocument document)
        {
            if (backgroundImagePath != null)
            {
                // Open as image to verify that it is valid
                System.Drawing.Image.FromFile(backgroundImagePath);
                document.SetBackgroundImage(backgroundImagePath);
            }
            else
            {
                // Validate color value
                System.Drawing.Color.FromArgb(Convert.ToInt32(backgroundColor, 16));
                document.SetBackgroundColor(backgroundColor);
            }
            document.FlushParts();
            if (passThru)
                WriteObject(document.Document, true);
            else
                document.Close();
        }

        #endregion
    }
}
