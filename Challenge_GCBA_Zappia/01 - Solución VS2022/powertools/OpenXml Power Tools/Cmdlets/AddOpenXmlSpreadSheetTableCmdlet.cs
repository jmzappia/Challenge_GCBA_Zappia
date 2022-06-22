/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/
/**************************************************************************
Author          : Johann Granados
Company         : Staff DotNet
Email           : johann.granados@staffdotnet.com
Blog            : http://blogs.staffdotnet.com/johanngranados
Creation Date   : 9/2/2008
**************************************************************************/
using System;
using System.IO;
using System.Linq;
using System.Collections.ObjectModel;
using System.Management.Automation;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;
using OpenXml.PowerTools.Commands;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Cmdlet for adding a new table to a worksheet in a SpreadsheetML document
    /// </summary>
    [Cmdlet(VerbsCommon.Add, "OpenXmlSpreadSheetTable", SupportsShouldProcess = true)]
    public class AddOpenXmlSpreadSheetTableCmdlet : OpenXmlCmdlet
    {
        #region Member definitions and Parameters

        private bool passThru = false;

        private string tableStyle = string.Empty;
        private SwitchParameter hasHeaders =false; 
        private short fromColumn;
        private short toColumn;
        private int fromRow;
        private int toRow;
        private string worksheetName;

        /// <summary>
        /// Table Style parameter
        /// </summary>
        [Parameter(Position = 1,
            Mandatory = true,
            HelpMessage = "Table Style Name")]
        [ValidateNotNullOrEmpty]
        public string TableStyle
        {
            get
            {
                return tableStyle;
            }
            set
            {
                tableStyle = value;
            }
        }

        /// <summary>
        /// Use Headers parameter
        /// </summary>
        [Parameter(Position = 2,
            Mandatory = false,
            HelpMessage = "Has Headers?")]
        [ValidateNotNullOrEmpty]
        public SwitchParameter HasHeaders
        {
            get
            {
            return hasHeaders;
            }
            set
            {
                hasHeaders = value;
            }
        }

        /// <summary>
        /// Initial table column
        /// </summary>
        [Parameter(Position = 3,
            Mandatory = true,
            HelpMessage = "Initial table column")]
        [ValidateNotNullOrEmpty]
        public short FromColumn
        {
            get
            {
                return fromColumn;
            }
            set
            {
                if (value > 0)
                {
                    fromColumn = value;
                }
                else
                {
                    throw new System.Management.Automation.ParameterBindingException("Initial Table Column must be greater than 0");
                }
            }
        }

        /// <summary>
        /// Final table column
        /// </summary>
        [Parameter(Position = 4,
            Mandatory = true,
            HelpMessage = "Final table column")]
        [ValidateNotNullOrEmpty]
        public short ToColumn
        {
            get
            {
                return toColumn;
            }
            set
            {
                if (value > 0)
                {
                    toColumn = value;
                }
                else
                {
                    throw new System.Management.Automation.ParameterBindingException("Final table column must be greater than 0");
                }
            }
        }

        /// <summary>
        /// Initial table row
        /// </summary>
        [Parameter(Position = 5,
            Mandatory = true,
            HelpMessage = "Initial table row")]
        [ValidateNotNullOrEmpty]
        public int FromRow
        {
            get
            {
                return fromRow;
            }
            set
            {
                if (value > 0)
                {
                    fromRow = value;
                }
                else
                {
                    throw new System.Management.Automation.ParameterBindingException("Initial Table Row must be greater than 0");
                }
            }
        }

        /// <summary>
        /// Final table row
        /// </summary>
        [Parameter(Position = 6,
            Mandatory = true,
            HelpMessage = "Final table row")]
        [ValidateNotNullOrEmpty]
        public int ToRow
        {
            get
            {
                return toRow;
            }
            set
            {
                if (value > 0)
                {
                    toRow = value;
                }
                else
                {
                    throw new System.Management.Automation.ParameterBindingException("Final table row must be greater than 0");
                }
            }
        }

        /// <summary>
        /// Index for worksheet to add the table to
        /// </summary>
        [Parameter(Position = 7,
            Mandatory = true,
            HelpMessage = "Worksheet name to add the table to")]
        [ValidateNotNullOrEmpty]
        public string WorksheetName
        {
            get
            {
                return worksheetName;
            }
            set
            {
                worksheetName = value;
            }
        }

        /// <summary>
        /// SuppressBackups parameter
        /// </summary>
        [Parameter(
            Position = 8,
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
            Position = 9,
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
            foreach (var document in AllDocuments("Add-OpenXmlSpreadSheetTable", FileAccess.ReadWrite))
            {
                try
                {
                    AddTable(document);
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
        #endregion

        #region Implementation
        /// <summary>
        /// Private method to call OpenXmlDocument.AddTable method for every Open Xml Document to process
        /// </summary>
        /// <param name="document">Open Xml Document to process in this call</param>
        private void AddTable(OpenXmlDocument document)
        {
            document.AddTable(worksheetName, tableStyle, hasHeaders, fromColumn, toColumn, fromRow, toRow);
            document.FlushParts();
            if (passThru)
                WriteObject(document.Document, true);
            else
                document.Close();
        }
        #endregion
    }
}
