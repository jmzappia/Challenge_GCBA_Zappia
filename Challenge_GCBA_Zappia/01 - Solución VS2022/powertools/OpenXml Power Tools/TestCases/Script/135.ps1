##
##	Testcase 135
##	Remove-OpenXmlDigitalSignature: Remove digital signature from a document with Read-Only attributes 
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/135.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/135 ../Input
mkdir ../Output/135

##################
# Execute cmdlet #
##################

Remove-OpenXmlDigitalSignature -Path ../Input/135/135.docx 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Access to the path ... is denied.'" -ForegroundColor Yellow
###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/135.Ok

	# copy to outpufile
	copy ../Input/135/135.docx ../Output/135
}
else
{
	"process error" > ../Results/135.Nok
}