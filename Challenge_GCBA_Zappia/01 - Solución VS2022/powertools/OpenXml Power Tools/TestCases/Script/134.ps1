##
##	Testcase 134
##	Remove-OpenXmlDigitalSignature: Remove digital signature from a not digitally-signed document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/134.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/134 ../Input
mkdir ../Output/134

##################
# Execute cmdlet #
##################

Remove-OpenXmlDigitalSignature -Path ../Input/134/134.docx
###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/134.Ok

	# copy to outpufile
	copy ../Input/134/134.docx ../Output/134
}
else
{
	"process error" > ../Results/134.Nok
}