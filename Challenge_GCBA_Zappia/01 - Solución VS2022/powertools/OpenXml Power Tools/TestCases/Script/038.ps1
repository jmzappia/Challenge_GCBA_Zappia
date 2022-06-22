##
##	Testcase 038
##	Get-OpenXmlDocument: Get a document from a bad-formed file
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/038.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/038 ../Input
mkdir ../Output/038

##################
# Execute cmdlet #
##################

$doc = (Get-OpenXmlDocument -Path ../Input/038/038.docx 2>&1)
$doc
Write-Host "This cmdlet execution is intented to fail as 'Package is not a valid OpenXml document'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

"process error" > ../Results/038.Nok