##
##	Testcase 035
##	Get-OpenXmlDigitalSignature: Get digital signatures from signed documents
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/035.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/035 ../Input
mkdir ../Output/035

##################
# Execute cmdlet #
##################

Get-OpenXmlDigitalSignature -Path ../Input/035/035.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/035.Ok

	# copy to outpufile
	copy ../Input/035/035.docx ../Output/035
}
else
{
	"process error" > ../Results/035.Nok
}