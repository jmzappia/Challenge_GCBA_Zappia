/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.IO;
using System.Collections.ObjectModel;
using System.Management.Automation;
using System.Xml;
using System.Xml.XPath;
using System.Linq;
using System.Xml.Linq;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Export-OpenXmlWordprocessing cmdlet
    /// </summary>
    [Cmdlet("Export", "OpenXmlWordprocessing", SupportsShouldProcess = true)]
    public class ExportOpenXmlWordprocessingCmdlet : PSCmdlet
    {
        #region Member definitions and Parameters

        private bool passThru = false;
        private string outputPath;
        private string text;
        private Collection<PTWordprocessingDocument> processedDocuments = new Collection<PTWordprocessingDocument>();

        /// <summary>
        /// Text parameter
        /// </summary>
        [Parameter(
            Position = 0,
            Mandatory = true,
            HelpMessage = "Text to insert in the new wordprocessing document")
        ]
        [ValidateNotNullOrEmpty]
        public string Text
        {
            get
            {
                return text;
            }
            set
            {
                text = value;
            }
        }

        /// <summary>
        /// OutputPath parameter
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = true,
            HelpMessage = "Path of file to store export results")
        ]
        [ValidateNotNullOrEmpty]
        public string OutputPath
        {
            get
            {
                return outputPath;
            }
            set
            {
                outputPath = Path.Combine(SessionState.Path.CurrentLocation.Path, value);
            }
        }

        /// <summary>
        /// PassThru parameter
        /// </summary>
        [Parameter(
            Position = 2,
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
                if (ShouldProcess(outputPath, "Export-OpenXmlWordprocessing"))
                {
                    PTWordprocessingDocument outputDocument = new PTWordprocessingDocument(outputPath, true);
                    outputDocument.InnerContent.SetContent(text);
                    outputDocument.FlushParts();
                    if (passThru)
                        WriteObject(outputDocument.Document, true);
                    else
                        outputDocument.Close();
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