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
    /// Transform-OpenXmlToHtml cmdlet	
    /// </summary>
    [Cmdlet(VerbsData.Export, "OpenXmlToHtml", SupportsShouldProcess = true)]
    public class ExportOpenXmlToHtmlCmdlet : OpenXmlCmdlet
    {
        #region Member definitions and Parameters

        private bool packing;
        private string resourcesPackageName = "";
        private string htmlOutputName = "";
        private string outputPath = "";
        private string xslPath = "";

        /// <summary>
        /// Packing parameter
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = false,
            HelpMessage = "Defines if the output files need to be contained inside a package")
        ]
        public SwitchParameter Packing
        {
            get
            {
                return packing;
            }
            set
            {
                packing = value;
            }
        }

        /// <summary>
        /// ResourcesPackageName parameter
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = false,
            HelpMessage = "Name of the output package")
        ]
        public string ResourcesPackageName
        {
            get
            {
                return resourcesPackageName;
            }
            set
            {
                resourcesPackageName = value;
            }
        }

        /// <summary>
        /// HtmlOutputName parameter
        /// </summary>
        [Parameter(
            Position = 3,
            Mandatory = true,
            HelpMessage = "Name of the html output file")
        ]
        public string HtmlOutputName
        {
            get
            {
                return htmlOutputName;
            }
            set
            {
                htmlOutputName = value;
            }
        }

        /// <summary>
        /// OutputPath parameter
        /// </summary>
        [Parameter(
            Position = 4,
            Mandatory = false,
            HelpMessage = "Path where output files are going to be placed")
        ]
        public string OutputPath
        {
            get
            {
                return outputPath;
            }
            set
            {
                outputPath = SessionState.AllMatchingFiles(value).First();
            }
        }

        /// <summary>
        /// XmlPath parameter
        /// </summary>
        [Parameter(
            Position = 5,
            Mandatory = true,
            HelpMessage = "Xsl file to use for the transformation, insted of the default xsl")
        ]
        public string XslPath
        {
            get
            {
                return xslPath;
            }
            set
            {
                xslPath = SessionState.AllMatchingFiles(value).First();
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
                string resolvedXslfilePath = SessionState.AllMatchingFiles(xslPath).First();
                string resolvedOutputPath = SessionState.AllMatchingFiles(outputPath).First();
                foreach (var document in AllDocuments("Export-OpenXmlToHtml", FileAccess.Read))
                {
                    try
                    {
                        if (ShouldProcess(resolvedOutputPath, "Export-OpenXmlToHtml"))
                            document.InnerContent.TransformToHtml(packing, resourcesPackageName, htmlOutputName, resolvedOutputPath, resolvedXslfilePath);
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
