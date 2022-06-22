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
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Gets the style.xml of a word document
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "OpenXmlStyle")]
    public class GetOpenXmlStyleCmdlet : OpenXmlCmdlet
    {
        #region Cmdlet operations

        /// <summary>
        /// Entry point for PowerShell cmdlets
        /// </summary>
        protected override void ProcessRecord()
        {
            try
            {
                foreach (var document in AllDocuments("Get-OpenXmlStyle", FileAccess.Read))
                {
                    try
                    {
                        XDocument styles = document.GetStylesDocument();
                        WriteObject(styles, true);
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
