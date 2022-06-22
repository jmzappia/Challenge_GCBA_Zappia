##
##	Testcase 011
##	Add-OpenXmlDigitalSignature: Resign a document with a previously used digital certificate
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/011.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/011 ../Input
mkdir ../Output/011

##################
# Execute cmdlet #
##################

Add-OpenXmlDigitalSignature -Path ../Input/011/011.docx -Certificate ../Input/011/011.pfx
###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/011.Ok

	# copy to outpufile
	copy ../Input/011/011.docx ../Output/011
}
else
{
	"process error" > ../Results/011.Nok
}