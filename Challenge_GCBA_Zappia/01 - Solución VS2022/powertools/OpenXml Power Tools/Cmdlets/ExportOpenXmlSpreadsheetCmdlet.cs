/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.IO;
using System.Management.Automation;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Out-OpenXmlSpreadsheet cmdlet
    /// </summary>
    [Cmdlet(VerbsData.Export, "OpenXmlSpreadsheet", SupportsShouldProcess = true)]
    public class ExportOpenXmlSpreadsheetCmdlet : PSCmdlet
    {
        #region Member definitions and Parameters

        private bool passThru = false;
        private PSObject[] pipeObjects;
        private Collection<PSObject> processedObjects = new Collection<PSObject>();
        private List<string> columnsToChart;
        string headerColumn;
        string outputPath;
        bool reportResults = true;
        bool displayChart;
        private int initialRow = 1;
        ChartType chartType;

        /// <summary>
        /// InputObject parameter
        /// </summary>
        [Parameter(
            Position = 0,
            ValueFromPipeline = true,
            HelpMessage = "Objects passed by pipe to be included in spreadsheet")
        ]
        public PSObject[] InputObject
        {
            get
            {
                return pipeObjects;
            }
            set
            {
                pipeObjects = value;
            }
        }

        /// <summary>
        /// Chart parameter
        /// </summary>
        [Parameter(
            Mandatory = false,
            ValueFromPipeline = false,
            ParameterSetName = "charting",
            HelpMessage = "Whether generate a chart from loaded data or not")
        ]
        public SwitchParameter Chart
        {
            get
            {
                return displayChart;
            }
            set
            {
                displayChart = value;
            }
        }

        /// <summary>
        /// ChartType parameter
        /// </summary>
        [Parameter(
            Mandatory = false,
            ValueFromPipeline = false,
            ParameterSetName = "charting",
            HelpMessage = "Type of chart to be generated")
        ]
        public ChartType ChartType
        {
            get
            {
                return chartType;
            }
            set
            {
                chartType = value;
            }
        }

        /// <summary>
        /// ColumnsToChart parameter
        /// </summary>
        [Parameter(
            Mandatory = false,
            ValueFromPipeline = false,
            ParameterSetName = "charting",
            HelpMessage = "Columns from data to be used as series in chart")
        ]
        public List<string> ColumnsToChart
        {
            get
            {
                return columnsToChart;
            }
            set
            {
                columnsToChart = value;
            }
        }

        /// <summary>
        /// HeaderColumn parameter
        /// </summary>
        [Parameter(
            Mandatory = false,
            ValueFromPipeline = false,
            ParameterSetName = "charting",
            HelpMessage = "Column from data to be used as category in chart")
        ]
        public string HeaderColumn
        {
            get
            {
                return headerColumn;
            }
            set
            {
                headerColumn = value;
            }
        }

        /// <summary>
        /// OutputPath parameter
        /// </summary>
        [Parameter(
            Mandatory = true,
            ValueFromPipeline = false,
            HelpMessage = "Path of file in which to store results")
        ]
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
            Position = 5,
            Mandatory = false,
            ValueFromPipeline = false,
            HelpMessage = "Header Row")
        ]
        [ValidateNotNullOrEmpty]
        public int InitialRow
        {
            get
            {
                return initialRow;
            }
            set
            {
                initialRow = value;
            }
        }

        /// <summary>
        /// PassThru parameter
        /// </summary>
        [Parameter(
            Position = 6,
            Mandatory = false,
            ValueFromPipeline = false,
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
                if (reportResults && ShouldProcess(outputPath, "Export-OpenXmlSpreadsheet"))
                {
                    if (pipeObjects != null)
                    {
                        foreach (PSObject pipeObject in pipeObjects)
                            processedObjects.Add(pipeObject);
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

        /// <summary>
        /// Actually creates the spreadsheet after all objects have been loaded
        /// </summary>
        protected override void EndProcessing()
        {
            SpreadsheetDocument outputPackage = CreateSpreadsheet(processedObjects);
            outputPackage.FlushParts();
            if (passThru)
                WriteObject(outputPackage);
            else
                outputPackage.Close();
        }

        #endregion

        #region Implementation

        /// <summary>
        /// Creates a spreadsheet document from an object collection
        /// </summary>
        /// <param name="objects">Object collection passed to cmdlet as parameter</param>
        /// <returns>Spreadsheet document</returns>
        private SpreadsheetDocument CreateSpreadsheet(Collection<PSObject> objects)
        {
            SpreadsheetDocument outputPackage = null;

            List<string> headerList;

            if (objects != null)
            {
                // Adds property names as column headers
                headerList = new List<string>();
                foreach (PSPropertyInfo propertyInfo in objects[0].Properties)
                {
                    headerList.Add(propertyInfo.Name.ToUpper());
                }

                // Stores into a matrix all properties of objects passed as parameter
                int rowLength = headerList.Count;
                int rowCount = objects.Count;
                string[][] valueMatrix = new string[rowCount][];

                int currentRow = 0, currentColumn = 0;
                foreach (PSObject obj in objects)
                {
                    currentColumn = 0;
                    valueMatrix[currentRow] = new string[rowLength];
                    foreach (PSPropertyInfo propertyInfo in obj.Properties)
                    {
                        try
                        {
                            if (propertyInfo.Value != null)
                            {
                                valueMatrix[currentRow][currentColumn] = propertyInfo.Value.ToString();
                            }
                        }
                        // Suppress errors on properties that cannot be read, but write the information to debug output.
                        catch (GetValueInvocationException e)
                        {
                            WriteDebug(string.Format(CultureInfo.InvariantCulture, "Exception ({0}) at Object {1}, property {2}", e.Message, currentRow, currentColumn));
                        }
                        currentColumn++;
                    }
                    currentRow++;
                }
                if (displayChart)
                    outputPackage = SpreadsheetDocument.Create(outputPath, headerList, valueMatrix, chartType, headerColumn, columnsToChart, initialRow);
                else
                    outputPackage = SpreadsheetDocument.Create(outputPath, headerList, valueMatrix, initialRow);
            }
            return outputPackage;
        }

        #endregion
    }
}