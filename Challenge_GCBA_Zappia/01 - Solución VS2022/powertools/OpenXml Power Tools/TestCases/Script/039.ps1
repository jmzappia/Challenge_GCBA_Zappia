##
##	Testcase 039
##	Get-OpenXmlDocument: Get a document from a no-openxml file 
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/039.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/039 ../Input
mkdir ../Output/039

##################
# Execute cmdlet #
##################

Get-OpenXmlDocument -Path ../Input/039/039.docx 2>&1
Write-Host "This cmdlet execution is intented to fail as 'File contains corrupted data'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/039.Ok

	# copy to outpufile
	copy ../Input/039/039.docx ../Output/039
}
else
{
	"process error" > ../Results/039.Nok
}