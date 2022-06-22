##
##	Testcase 136
##	Remove-OpenXmlDigitalSignature: Remove digital signature from a non-existent document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/136.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/136 ../Input
mkdir ../Output/136

##################
# Execute cmdlet #
##################

Remove-OpenXmlDigitalSignature -Path ../Input/136/136.docx 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Cannot find path ... because it does not exist.'" -ForegroundColor Yellow
###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/136.Ok

	# copy to outpufile
	copy ../Input/136/136.docx ../Output/136
}
else
{
	"process error" > ../Results/136.Nok
}