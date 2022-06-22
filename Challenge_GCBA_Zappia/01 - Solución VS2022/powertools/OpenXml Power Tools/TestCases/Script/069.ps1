##
##	Testcase 069
##	Set-OpenXmlContentFormat: Set invalid format to a run or paragraph
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/069.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/069 ../Input
mkdir ../Output/069

##################
# Execute cmdlet #
##################

Set-OpenXmlContentFormat -Path ../Input/069/069.docx -Content '<XXX>' -InsertionPoint /w:document/w:body/w:p/w:r[1] 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Unexpected end of file has occurred. The following elements are not closed: XXX. Line 1, position 6.'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/069.Ok

	# copy to outpufile
	copy ../Input/069/069.docx ../Output/069
}
else
{
	"process error" > ../Results/069.Nok
}