/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.IO;
using System.Collections.ObjectModel;
using System.Management.Automation;
using System.Xml.Linq;
using System.Linq;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Get-OpenXmlCustomXmlData cmdlet
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "OpenXmlCustomXmlData")]
    public class GetOpenXmlCustomXmlData : OpenXmlCmdlet
    {
        #region Member definitions and Parameters

        string xmlPartName;

        /// <summary>
        /// Part parameter
        /// </summary>
        [Parameter(
            Position = 1,
            Mandatory = true,
            HelpMessage = "Custom Xml part name")
        ]
        [ValidateNotNullOrEmpty]
        public string Part
        {
            get
            {
                return xmlPartName;
            }
            set
            {
                xmlPartName = value;
            }
        }

        #endregion

        #region Cmdlet operations
        
        /// <summary>
        /// Entry point for Power Shell Cmdlets
        /// </summary>
        protected override void ProcessRecord()
        {
            try
            {
                foreach (var document in AllDocuments("Get-OpenXmlCustomXmlData", FileAccess.Read))
                {
                    try
                    {
                        XDocument custom = document.FindCustomXml(xmlPartName);
                        WriteObject(custom, true);
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