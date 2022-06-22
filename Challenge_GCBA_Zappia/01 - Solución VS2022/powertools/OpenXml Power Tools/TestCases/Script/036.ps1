##
##	Testcase 036
##	Get-OpenXmlDigitalSignature: Get digital signatures from unsigned documents
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/036.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/036 ../Input
mkdir ../Output/036

##################
# Execute cmdlet #
##################

Get-OpenXmlDigitalSignature -Path ../Input/036/036.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/036.Ok

	# copy to outpufile
	copy ../Input/036/036.docx ../Output/036
}
else
{
	"process error" > ../Results/036.Nok
}