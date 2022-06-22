##
##	Testcase 084
##	Set-OpenXmlHeader: Set valid header to a file with headers
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/084.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/084 ../Input
mkdir ../Output/084

##################
# Execute cmdlet #
##################

Set-OpenXmlHeader -Path ../Input/084/084.docx -HeaderPath ../Input/084/header1.xml -HeaderType First
Set-OpenXmlHeader -Path ../Input/084/084.docx -HeaderPath ../Input/084/header2.xml -HeaderType Even 2>&1
Set-OpenXmlHeader -Path ../Input/084/084.docx -HeaderPath ../Input/084/header3.xml -HeaderType Default
Write-Host "This cmdlet execution is intented to fail as 'Unexpected end of file has occurred. The following elements are not closed: BAD. Line 1, position 6.'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/084.Ok

	# copy to outpufile
	copy ../Input/084/084.docx ../Output/084
}
else
{
	"process error" > ../Results/084.Nok
}