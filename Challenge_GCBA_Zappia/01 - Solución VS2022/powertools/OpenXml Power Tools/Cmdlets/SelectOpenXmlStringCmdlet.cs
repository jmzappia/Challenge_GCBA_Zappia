/***************************************************************************

Copyright (c) Microsoft Corporation 2009.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.IO;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using System.Management.Automation;
using System.Xml.Linq;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;
using OpenXml.PowerTools.Wordprocessing;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Match information for Select-OpenXmlString
    /// </summary>
    public class MatchInfo
    {
        /// <summary>
        /// Full path of file that matched
        /// </summary>
        public string Path { get; set; }
        /// <summary>
        /// Filename of file that matched
        /// </summary>
        public string Filename
        {
            get
            {
                if (Path == null)
                    return null;
                FileInfo info = new FileInfo(Path);
                return info.Name;
            }
        }
        /// <summary>
        /// Element number of element whose style or content matched
        /// </summary>
        public int ElementNumber { get; set; }
        /// <summary>
        /// Full contents, without formatting, of matched element
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// The first style that matched the element
        /// </summary>
        public string Style { get; set; }
        /// <summary>
        /// The first pattern that matched the content of the element
        /// </summary>
        public string Pattern { get; set; }
        /// <summary>
        /// Indicates if case was ignored on the pattern match
        /// </summary>
        public bool IgnoreCase { get; set; }

        /// <summary>
        /// Simple constructor
        /// </summary>
        public MatchInfo()
        {
        }
    }

    /// <summary>
    /// Get the footer files of a word document
    /// </summary>
    [Cmdlet(VerbsCommon.Select, "OpenXmlString")]
    public class SelectOpenXmlString : OpenXmlCmdlet
    {
        private string[] m_StyleSearch;
        private string[] m_TextSearch;
        private bool m_SimpleMatch = false;
        private bool m_CaseSensitive = false;
        private bool m_List = false;

        /// <summary>
        /// A list of text strings to match.
        /// </summary>
        [Parameter(Position = 2,
           Mandatory = false,
           HelpMessage = "Specifies the a list of text strings to match.")
        ]
        public string[] Pattern
        {
            get
            {
                return m_TextSearch;
            }
            set
            {
                m_TextSearch = value;
            }
        }

        /// <summary>
        /// A list of style names to match.
        /// </summary>
        [Parameter(
           Mandatory = false,
           HelpMessage = "Specifies the a list of style names to match.")
        ]
        public string[] Style
        {
            get
            {
                return m_StyleSearch;
            }
            set
            {
                m_StyleSearch = value;
            }
        }

        /// <summary>
        /// simpleMatch parameter
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Specifies that a simple match, rather than a regular expression match, should be used.")
        ]
        [ValidateNotNullOrEmpty]
        public SwitchParameter simpleMatch
        {
            get
            {
                return m_SimpleMatch;
            }
            set
            {
                m_SimpleMatch = value;
            }
        }

        /// <summary>
        /// caseSensitive parameter
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Makes matches case sensitive. By default, matching is not case sensitive.")
        ]
        [ValidateNotNullOrEmpty]
        public SwitchParameter caseSensitive
        {
            get
            {
                return m_CaseSensitive;
            }
            set
            {
                m_CaseSensitive = value;
            }
        }

        /// <summary>
        /// list parameter
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "Specifies that only one match should result for each input file. The returned MatchInfo objects only include information about that first match.")
        ]
        [ValidateNotNullOrEmpty]
        public SwitchParameter list
        {
            get
            {
                return m_List;
            }
            set
            {
                m_List = value;
            }
        }

        /// <summary>
        /// Entry point for PowerShell commandlets
        /// </summary>
        protected override void ProcessRecord()
        {
            List<MatchInfo> results = new List<MatchInfo>();
            try
            {
                foreach (var document in AllDocuments("Select-OpenXmlString", FileAccess.Read))
                {
                    try
                    {
                        MatchInfo[] result = document.Document.SearchInDocument(m_StyleSearch, m_TextSearch, !m_SimpleMatch, !m_CaseSensitive);
                        if (!m_List)
                            foreach (MatchInfo item in result)
                            {
                                item.Path = document.FullName;
                                results.Add(item);
                            }
                        else if (result.GetUpperBound(0) >= 0)
                        {
                            result[0].Path = document.FullName;
                            results.Add(result[0]);
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
                WriteObject(results, true);
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
    }
}
