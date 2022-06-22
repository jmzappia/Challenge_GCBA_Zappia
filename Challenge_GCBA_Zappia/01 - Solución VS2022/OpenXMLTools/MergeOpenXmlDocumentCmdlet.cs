using System;
using System.IO;
using System.Collections.ObjectModel;
using System.Management.Automation;
using System.Xml.Linq;
using DocumentFormat.OpenXml.Packaging;
using System.Collections.Generic;

namespace OpenXml.PowerTools
{
    /// <summary>
    /// Specify the entire source document	
    /// </summary>
    public class DocumentSource
    {
        /// <summary>
        /// Full or relative path name for the file
        /// </summary>
        public string SourceFile;
        /// <summary>
        /// Starting paragraph number (1 is the first paragraph)
        /// </summary>
        public int Start;
        /// <summary>
        /// Number of paragraphs
        /// </summary>
        public int Count;
        /// <summary>
        /// True, if you want to keep the section at the end of the document
        /// </summary>
        public bool KeepSection;

        /// <summary>
        /// Specify the entire source document	
        /// </summary>
        public DocumentSource(string source)
        {
            SourceFile = source;
            Start = -1;
            Count = -1;
        }
        /// <summary>
        /// Specify from "start" to the end of the document	
        /// </summary>
        public DocumentSource(string source, int start)
        {
            SourceFile = source;
            Start = start;
            Count = -1;
        }
        /// <summary>
        /// Specify from "start" and include "count" number of paragraphs
        /// </summary>
        public DocumentSource(string source, int start, int count)
        {
            SourceFile = source;
            Start = start;
            Count = count;
        }
    }
}

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Transform-OpenXmlToHtml cmdlet	
    /// </summary>
    [Cmdlet(VerbsData.Merge, "OpenXmlDocument", SupportsShouldProcess = true)]
    public class GetOpenXmlParagraph : OpenXmlCmdlet
    {
        private bool m_PassThru = false;
        private DocumentSource[] m_Sources;
        private string m_OutputPath = "";
        private int m_Start = 1;
        private int m_Count = -1;
        private bool m_KeepSections = false;

        /// <summary>
        /// OutputPath parameter
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = true,
            HelpMessage = "Path of file for output document")
        ]
        public string OutputPath
        {
            get
            {
                return m_OutputPath;
            }
            set
            {
                m_OutputPath = System.IO.Path.Combine(SessionState.Path.CurrentLocation.Path, value);
            }
        }

        /// <summary>
        /// Start parameter
        /// </summary>
        [Parameter(
            Position = 2,
            Mandatory = false,
            HelpMessage = "Starting paragraph number to extract")
        ]
        public int Start
        {
            get
            {
                return m_Start;
            }
            set
            {
                m_Start = value;
            }
        }

        /// <summary>
        /// Count parameter
        /// </summary>
        [Parameter(
            Position = 3,
            Mandatory = false,
            HelpMessage = "Number of paragraphs to extract")
        ]
        public int Count
        {
            get
            {
                return m_Count;
            }
            set
            {
                m_Count = value;
            }
        }

        /// <summary>
        /// KeepSections parameter
        /// </summary>
        [Parameter(
            Position = 4,
            Mandatory = false,
            HelpMessage = "Keep a section break between each merged document.")
        ]
        [ValidateNotNullOrEmpty]
        public SwitchParameter KeepSections
        {
            get
            {
                return m_KeepSections;
            }
            set
            {
                m_KeepSections = value;
            }
        }

        /// <summary>
        /// Sources parameter
        /// </summary>
        [Parameter(
            Position = 5,
            Mandatory = false,
            HelpMessage = "Array of sources to extract")
        ]
        public DocumentSource[] Sources
        {
            get
            {
                return m_Sources;
            }
            set
            {
                m_Sources = value;
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
                return m_PassThru;
            }
            set
            {
                m_PassThru = value;
            }
        }

        /// <summary>
        /// Entry point for PowerShell cmdlets
        /// </summary>
        protected override void ProcessRecord()
        {
            List<Source> sources = new List<Source>();
            try
            {
                foreach (var document in AllDocuments("Merge-OpenXmlDocumentCmdlet", FileAccess.Read))
                {
                    WordprocessingDocument wordDoc = document.Document as WordprocessingDocument;
                    if (wordDoc != null)
                    {
                        if (m_Count != -1)
                            sources.Add(new Source(wordDoc, m_Start - 1, m_Count, m_KeepSections));
                        else
                            sources.Add(new Source(wordDoc, m_Start - 1, m_KeepSections));
                    }
                }
                if (m_Sources != null)
                {
                    foreach (DocumentSource source in m_Sources)
                    {
                        WordprocessingDocument doc = WordprocessingDocument.Open(source.SourceFile, false);
                        if (source.Count != -1)
                            sources.Add(new Source(doc, source.Start - 1, source.Count, source.KeepSection));
                        else if (source.Start != -1)
                            sources.Add(new Source(doc, source.Start - 1, source.KeepSection));
                        else
                            sources.Add(new Source(doc, source.KeepSection));
                    }
                }
                WordprocessingDocument result = DocumentBuilder.BuildOpenDocument(sources, m_OutputPath);
                result.FlushParts();
                if (m_PassThru)
                    WriteObject(result, true);
                else
                    result.Close();
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
            finally
            {
                foreach (Source item in sources)
                    item.Close();
            }
        }
    }
}
