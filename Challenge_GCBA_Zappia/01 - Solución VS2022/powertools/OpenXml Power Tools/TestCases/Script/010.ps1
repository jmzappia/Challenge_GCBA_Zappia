##
##	Testcase 010
##	Add-OpenXmlDigitalSignature: Sign a signed document 
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/010.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/010 ../Input
mkdir ../Output/010

##################
# Execute cmdlet #
##################

Add-OpenXmlDigitalSignature -Path ../Input/010/010.docx -Certificate ../Input/010/010.pfx
###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/010.Ok

	# copy to outpufile
	copy ../Input/010/010.docx ../Output/010
}
else
{
	"process error" > ../Results/010.Nok
}