/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.IO;
using System.Collections.ObjectModel;
using System.Management.Automation;
using OpenXmlSDK = DocumentFormat.OpenXml.Packaging;
using OpenXml.PowerTools.Wordprocessing;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Get-OpenXmlComment cmdlet	
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "OpenXmlComment")]
    public class GetOpenXmlCommentCmdlet : OpenXmlCmdlet
    {
        #region Cmdlet operations

        /// <summary>
        /// Entry point for PowerShell cmdlets
        /// </summary>
        protected override void ProcessRecord()
        {
            try
            {
                foreach (var document in AllDocuments("Get-OpenXmlComment", FileAccess.Read))
                {
                    try
                    {
                        object comments = document.GetAllComments(CommentFormat.Xml);
                        WriteObject(comments, true);
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