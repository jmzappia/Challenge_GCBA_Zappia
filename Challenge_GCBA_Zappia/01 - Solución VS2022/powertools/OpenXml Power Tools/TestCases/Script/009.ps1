##
##	Testcase 009
##	Add-OpenXmlDigitalSignature: Sign an unsigned document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/009.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/009 ../Input
mkdir ../Output/009

##################
# Execute cmdlet #
##################

Add-OpenXmlDigitalSignature -Path ../Input/009/009.docx -Certificate ../Input/009/009.pfx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/009.Ok

	# copy to outpufile
	copy ../Input/009/009.docx ../Output/009
}
else
{
	"process error" > ../Results/009.Nok
}