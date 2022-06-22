/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.Linq;
using System.IO;
using System.Collections.ObjectModel;
using System.Management.Automation;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Add-OpenXmlPicture cmdlet
    /// </summary>
    [Cmdlet(VerbsCommon.Add, "OpenXmlPicture", SupportsShouldProcess = true)]
    public class AddOpenXmlPicture : OpenXmlCmdlet
    {
        #region Member definitions and Parameters

        private bool passThru = false;
        private string xpathInsertionPoint;
        private string picturePath;
        private System.Drawing.Image image;

        /// <summary>
        /// InsertionPoint parameter
        /// </summary>
        [Parameter(Position = 2, Mandatory = true, HelpMessage = "Insertion point location")]
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
        /// PassThru parameter
        /// </summary>
        [Parameter(Position = 3, Mandatory = false, HelpMessage = "Picture path")]
        [ValidateNotNullOrEmpty]
        public string PicturePath
        {
            get
            {
                return picturePath;
            }
            set
            {
                picturePath = SessionState.AllMatchingFiles(value).First();
            }
        }

        /// <summary>
        /// ImageFile parameter
        /// </summary>
        [Parameter(
            Mandatory = false,
            ValueFromPipeline = true,
            HelpMessage = "Image object to be inserted")
        ]
        [ValidateNotNullOrEmpty]
        public System.IO.FileInfo ImageFile
        {
            get
            {
                return new System.IO.FileInfo(picturePath == null ? "." : picturePath);
            }
            set
            {
                picturePath = value.FullName;
            }
        }

        /// <summary>
        /// Specify the SupressBackups parameter
        /// </summary>
        [Parameter(
            Position = 4,
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
                string picName = "PowerToolsPicture";
                if (image == null && picturePath != null)
                {
                    image = System.Drawing.Image.FromFile(picturePath, true);
                    picName = picturePath.Substring(picturePath.LastIndexOf('\\')+1);
                }
                foreach (var document in AllDocuments("Add-OpenXmlPicture", FileAccess.ReadWrite))
                {
                    try
                    {
                        document.InsertPicture(xpathInsertionPoint, image, picName);
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
            catch (OutOfMemoryException)
            {
                WriteError(new ErrorRecord(new ArgumentException("Invalid picture file."), "InvalidArgument", ErrorCategory.InvalidArgument, null));
            }
            catch (Exception e)
            {
                WriteError(new ErrorRecord(e, "General", ErrorCategory.NotSpecified, null));
            }
        }
        #endregion
    }
}
