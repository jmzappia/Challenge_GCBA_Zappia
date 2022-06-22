##
##	Testcase 040
##	Get-OpenXmlFooter: Get the footer from a document with footers
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/040.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/040 ../Input
mkdir ../Output/040

##################
# Execute cmdlet #
##################

Get-OpenXmlFooter -Path ../Input/040/040.docx -FooterType First

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/040.Ok

	# copy to outpufile
	copy ../Input/040/040.docx ../Output/040
}
else
{
	"process error" > ../Results/040.Nok
}