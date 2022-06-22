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
    /// Set-OpenXmlCustomXmlData cmdlet	
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "OpenXmlCustomXmlData", SupportsShouldProcess = true)]
    public class SetOpenXmlCustomXmlDataCmdlet : OpenXmlCmdlet
    {
        #region Member definitions and Parameters

        private bool passThru = false;
        private string xmlPath;
        private string partName;
        private XDocument customData;

        /// <summary>
        /// Specify the CustomXmlPart parameter
        /// </summary>
        [Parameter(Position = 1,
            Mandatory = false,
            HelpMessage = "Custom Xml part path")]
        [ValidateNotNullOrEmpty]
        public string PartPath
        {
            get
            {
                return xmlPath;
            }
            set
            {
                var xmlPartFileNames = SessionState.AllMatchingFiles(value);
                if (xmlPartFileNames.Count() == 1)
                {
                    xmlPath = xmlPartFileNames.First();
                }
                else if (xmlPartFileNames.Count() > 1)
                {
                    throw new Exception("Too many xmlParts specified.");
                }

            }
        }

        /// <summary>
        /// Specify the CustomXmlPart parameter
        /// </summary>
        [Parameter(Position = 2,
            Mandatory = false,
            HelpMessage = "Name for the new custom part")]
        [ValidateNotNullOrEmpty]
        public string PartName
        {
            get
            {
                return partName;
            }
            set
            {
                partName = value;
            }
        }

        /// <summary>
        /// Specify the CustomXmlPart parameter
        /// </summary>
        [Parameter(Position = 3,
            Mandatory = false,
            ValueFromPipeline = true,
            HelpMessage = "Custom Xml document")]
        [ValidateNotNullOrEmpty]
        public XDocument Part
        {
            get
            {
                return customData;
            }
            set
            {
                customData = value;
            }
        }

        /// <summary>
        /// Specify the SupressBackups parameter
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
        /// Specify the PassThru parameter
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
                if (xmlPath != null)
                {
                    customData = XDocument.Load(xmlPath);
                    if (partName == null)
                        partName = System.IO.Path.GetFileName(xmlPath);
                }
                if (customData == null)
                {
                    WriteError(new ErrorRecord(new Exception("No custom data was specified."), "BadParameters", ErrorCategory.InvalidArgument, null));
                }
                else if (partName == null)
                {
                    WriteError(new ErrorRecord(new Exception("No name for the custom part was specified."), "BadParameters", ErrorCategory.InvalidArgument, null));
                }
                else
                {
                    foreach (var document in AllDocuments("Set-OpenXmlCustomXmlData", FileAccess.ReadWrite))
                    {
                        try
                        {
                            document.SetCustomXmlDocument(customData, partName);
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