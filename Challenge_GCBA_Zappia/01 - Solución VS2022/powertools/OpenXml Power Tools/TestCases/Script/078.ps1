##
##	Testcase 078
##	Set-OpenXmlCustomXmlData: Set customXml part by using invalid xml file
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/078.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/078 ../Input
mkdir ../Output/078

##################
# Execute cmdlet #
##################

Set-OpenXmlCustomXmlData -Path ../Input/078/078.docx -PartPath ../Input/078/item1.xml 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'File specified is not a valid XML file'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/078.Ok

	# copy to outpufile
	copy ../Input/078/078.docx ../Output/078
}
else
{
	"process error" > ../Results/078.Nok
}