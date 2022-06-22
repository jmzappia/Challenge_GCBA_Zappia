##
##	Testcase 034
##	Get-OpenXmlCustomXmlData: Get an inexistent customXml data part
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/034.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/034 ../Input | Out-Null
mkdir ../Output/034 | Out-Null

##################
# Execute cmdlet #
##################

Get-OpenXmlCustomXmlData -Path ../Input/034/034.docx -Part "itemThatDoesNotExist.xml" 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Part name 'itemThatDoesNotExist.xml' not found.'" -ForegroundColor Yellow


###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/034.Ok

	# copy to outpufile
	copy ../Input/034/034.docx ../Output/034
}
else
{
	"process error" > ../Results/034.Nok
}