/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;
using System.Management.Automation;
using System.Xml;
using System.Xml.Linq;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Split-OpenXmlDocument cmdlet
    /// </summary>
    [Cmdlet(VerbsCommon.Split, "OpenXmlDocument", SupportsShouldProcess = true)]
    public class SplitOpenXmlDocumentCmdlet : OpenXmlCmdlet
    {
        #region Member definitions and Parameters

        private string outputPath = null;
        private string prefix;
        private bool passThru = false;

        /// <summary>
        /// Prefix parameter
        /// </summary>
        [Parameter(Position = 1,
           Mandatory = true,
           HelpMessage = "Defines the output file path of resulting document")
        ]
        public string Prefix
        {
            get
            {
                return prefix;
            }
            set
            {
                prefix = value;
            }
        }

        /// <summary>
        /// OutputPath parameter
        /// </summary>
        [Parameter(Position = 2,
           Mandatory = false,
           HelpMessage = "Defines the output file path of resulting document")
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
        /// PassThru parameter
        /// </summary>
        [Parameter(
            Position = 3,
            Mandatory = false,
            HelpMessage = "Use this switch to pipe out the processed documents.")
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
                string fullPrefix = prefix;
                if (outputPath != null)
                    fullPrefix = outputPath + "/" + prefix;
                List<PTWordprocessingDocument> splits = new List<PTWordprocessingDocument>();
                foreach (var document in AllDocuments("Split-OpenXmlDocument", FileAccess.Read))
                {
                    try
                    {
                        splits.AddRange(SplitOnSections(((PTWordprocessingDocument)document), fullPrefix));
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
                if (passThru)
                    WriteObject(splits, true);
                else
                {
                    foreach (var splitDoc in splits)
                        splitDoc.Close();
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
        private List<PTWordprocessingDocument> SplitOnSections(PTWordprocessingDocument doc, string filenamePrefix)
        {
            XNamespace ns = "http://schemas.openxmlformats.org/wordprocessingml/2006/main";
            List<PTWordprocessingDocument> result = new List<PTWordprocessingDocument>();
            XDocument mainPart = doc.GetXDocument(doc.Document.MainDocumentPart);
            List<XElement> contents = new List<XElement>();
            int number = 1;
            foreach (XElement element in mainPart.Descendants(ns + "body").Elements())
            {
                contents.Add(new XElement(element));
                if (element.Descendants(ns + "sectPr").Count() != 0)
                {
                    result.Add(CreateSplitDocument(doc, mainPart, contents, String.Format("{0}{1}.docx", filenamePrefix, number)));
                    number++;
                    contents.Clear();
                }
            }
            if (contents.Count() != 0)
                result.Add(CreateSplitDocument(doc, mainPart, contents, String.Format("{0}{1}.docx", filenamePrefix, number)));
            return result;
        }
        private PTWordprocessingDocument CreateSplitDocument(PTWordprocessingDocument doc, XDocument mainPart, List<XElement> contents, string newFileName)
        {
            PTWordprocessingDocument newDoc = new PTWordprocessingDocument(newFileName, true);
            newDoc.InnerContent.SetContent("");
            //FixRanges(mainPart, contents);
            //CopyReferences(doc, newDoc, contents);
            newDoc.InnerContent.SetContent(contents);
            newDoc.FlushParts();
            return newDoc;
        }
    }
}
