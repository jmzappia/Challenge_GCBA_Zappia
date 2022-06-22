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
    /// Cmdlet for setting a value for a specific cell in a worksheet in a SpreadsheetML document
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "OpenXmlSpreadSheetCellValue", SupportsShouldProcess = true)]
    public class SetOpenXmlSpreadSheetCellValueCmdlet:OpenXmlCmdlet
    {
        #region Member definitions and Parameters
        private int fromRow;
        private int toRow;
        private short fromColumn;
        private short toColumn;
        private string _value;
        private string worksheetName;
        private SwitchParameter passThru;

        /// <summary>
        /// Initial row for start setting the value
        /// </summary>
        [Parameter(Position = 1,
            Mandatory = true,
            HelpMessage = "Initial row for start setting the value")]
        [ValidateNotNullOrEmpty]
        public int FromRow
        {
            get
            {
                return fromRow;
            }
            set
            {   
                if(value >0)
                {
                    fromRow = value;
                }
                else
                {
                    new System.Management.Automation.ParameterBindingException("Initial row must be greater than zero");
                }
            }
        }

        /// <summary>
        /// Initial row for start setting the value
        /// </summary>
        [Parameter(Position = 2,
            Mandatory = true,
            HelpMessage = "Final row for start setting the value")]
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
                    new System.Management.Automation.ParameterBindingException("Final row must be greater than zero");
                }
            }
        }

        /// <summary>
        /// Initial column for start setting the value
        /// </summary>
        [Parameter(Position = 3,
            Mandatory = true,
            HelpMessage = "Initial column for start setting the value")]
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
                    new System.Management.Automation.ParameterBindingException("Initial column must be greater than zero");
                }
            }
        }

        /// <summary>
        /// Final column for start setting the value
        /// </summary>
        [Parameter(Position = 4,
            Mandatory = true,
            HelpMessage = "Final column for start setting the value")]
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
                    new System.Management.Automation.ParameterBindingException("Final column must be greater than zero");
                }
            }
        }

        /// <summary>
        /// Cell value
        /// </summary>
        [Parameter(Position = 5,
            Mandatory = true,
            HelpMessage = "Cell value")]
        [ValidateNotNullOrEmpty]
        public string Value
        {
            get
            {
                return _value;
            }
            set
            {
                _value = value;
            }
        }

        /// <summary>
        /// Worksheet name to set the cell value
        /// </summary>
        [Parameter(Position = 6,
            Mandatory = true,
            HelpMessage = "Worksheet name to set the cell value")]
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
            Position = 7,
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
            Position = 8,
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
            foreach (var document in AllDocuments("Set-OpenXmlSpreadSheetCellValue", FileAccess.ReadWrite))
            {
                try
                {
                    SetCellValue(document);
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
        private void SetCellValue(OpenXmlDocument document)
        {
            document.SetCellValue(worksheetName, fromRow, toRow, fromColumn, toColumn, _value);
            document.FlushParts();
            if (passThru)
                WriteObject(document.Document, true);
            else
                document.Close();
        }
        #endregion

    }
}
