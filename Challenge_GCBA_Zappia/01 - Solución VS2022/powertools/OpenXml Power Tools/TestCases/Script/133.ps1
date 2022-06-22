##
##	Testcase 133
##	Remove-OpenXmlDigitalSignature: Remove digital signature from a digitally-signed document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/133.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/133 ../Input
mkdir ../Output/133

##################
# Execute cmdlet #
##################

Remove-OpenXmlDigitalSignature -Path ../Input/133/133.docx
###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/133.Ok

	# copy to outpufile
	copy ../Input/133/133.docx ../Output/133
}
else
{
	"process error" > ../Results/133.Nok
}