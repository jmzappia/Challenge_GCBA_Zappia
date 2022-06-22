/***************************************************************************

Copyright (c) Microsoft Corporation 2008.

This code is licensed using the Microsoft Public License (Ms-PL).  The text of the license can be found here:

http://www.microsoft.com/resources/sharedsource/licensingbasics/publiclicense.mspx

***************************************************************************/

using System;
using System.Collections.Generic;
using System.Text;
using System.Management.Automation;
using System.Collections;
using System.IO;
using System.Linq;
using System.Collections.ObjectModel;
using DocumentFormat.OpenXml.Packaging;

namespace OpenXml.PowerTools.Commands
{
    /// <summary>
    /// Base cmdlet for OpenXml Power Tools
    /// </summary>
    public class OpenXmlCmdlet : PSCmdlet
    {

        #region Member definitions and Parameters

        private OpenXmlPackage[] documents;
        internal bool suppressBackups = false;
        internal string[] fileNameReferences;
        internal Collection<OpenXmlDocument> processedDocuments = new Collection<OpenXmlDocument>();

        /// <summary>
        /// Specify the Document parameter
        /// </summary>
        [Parameter(
            Mandatory = false,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "Specifies the package(s) to be processed.")]
        public OpenXmlPackage[] Document
        {
            get
            {
                return documents;
            }
            set
            {
                documents = value;
            }
        }

        /// <summary>
        /// Specify the Path parameter
        /// </summary>
        [Parameter(Position = 0,
            Mandatory = false,
            HelpMessage = "Specifies the path to the packages to be processed")]
        [ValidateNotNullOrEmpty]
        public string[] Path
        {
            set
            {
                fileNameReferences = value;
            }
        }

        #endregion

        /// <summary>
        /// Called when cmdlet goes out of scope
        /// </summary>
        protected override void EndProcessing()
        {
            //Closes all packages processed
            if (processedDocuments.Count > 0)
            {
                foreach (OpenXmlDocument document in processedDocuments)
                    document.Close();
            }
        }

        internal IEnumerable<OpenXmlDocument> AllDocuments(string action, FileAccess access)
        {
            if (fileNameReferences != null)
            {
                foreach (var path in fileNameReferences)
                {
                    foreach (var file in SessionState.Path.GetResolvedPSPathFromPSPath(path))
                    {
                        if (access != FileAccess.ReadWrite || ShouldProcess(file.Path, action))
                        {
                            if (access == FileAccess.ReadWrite && !suppressBackups)
                                CreateBackupFile(file.Path);
                            yield return OpenXmlDocument.FromFile(file.Path, access);
                        }
                    }
                }
            }
            else if (Document != null)
            {
                foreach (OpenXmlPackage document in Document)
                    yield return OpenXmlDocument.FromPackage(document);
            }
        }

        /// <summary>
        /// Creates a backup file
        /// </summary>
        /// <param name="originalFilePath">Path of the original file to backup</param>
        internal static void CreateBackupFile(string originalFilePath)
        {
            const string backupSuffix = "_Copy";
            // Builds the name of the backup file name
            string originalFileName = System.IO.Path.GetFileNameWithoutExtension(originalFilePath);
            string originalFileExtension = System.IO.Path.GetExtension(originalFilePath);
            // Higher backup number variable
            int higherBackupId = 0;

            // Searches for higher backup index from all files that match backup file pattern
            foreach (string filePath in Directory.GetFiles(System.IO.Path.GetDirectoryName(originalFilePath), originalFileName + backupSuffix + "*" + originalFileExtension))
            {
                string fileName = System.IO.Path.GetFileNameWithoutExtension(filePath);

                //  Gets the position of backup id
                int backupIdPosition = fileName.LastIndexOf(backupSuffix) + backupSuffix.Length;

                //  Gets the value of backup id
                string numberPart = fileName.Substring(backupIdPosition);
                int id;
                bool correctConversion = int.TryParse(numberPart, out id);
                if (correctConversion)
                    // Caches the higher id
                    if (id > higherBackupId)
                        higherBackupId = id;
            }

            // Creates the new backup file name from higher backup id
            string backupFilePath =
                string.Format(@"{0}\{1}{2}{3:00}{4}",
                    System.IO.Path.GetDirectoryName(originalFilePath),
                    originalFileName,
                    backupSuffix,
                    higherBackupId + 1,
                    System.IO.Path.GetExtension(originalFilePath)
                );

            //  Creates the backup file
            File.Copy(originalFilePath, backupFilePath);
        }
    }
    /// <summary>
    /// Extensions to SessionState functionality
    /// </summary>
    public static class LocalExtensions
    {
        /// <summary>
        /// Returns all existing files that match with given criteria
        /// </summary>
        /// <param name="sessionState">Class to extend</param>
        /// <param name="paths">Criteria list</param>
        /// <returns>Full file path</returns>
        public static IEnumerable<string> AllMatchingFiles(this SessionState sessionState, string[] paths)
        {
            foreach (var path in paths)
                foreach (var file in sessionState.Path.GetResolvedPSPathFromPSPath(path))
                    yield return file.Path;
        }

        /// <summary>
        /// Returns all existing files that match with given criteria
        /// </summary>
        /// <param name="sessionState">Class to extend</param>
        /// <param name="path">Criteria</param>
        /// <returns>Full file path</returns>
        public static IEnumerable<string> AllMatchingFiles(this SessionState sessionState, string path)
        {
            foreach (var file in sessionState.Path.GetResolvedPSPathFromPSPath(path))
                yield return file.Path;
        }
    }
}
