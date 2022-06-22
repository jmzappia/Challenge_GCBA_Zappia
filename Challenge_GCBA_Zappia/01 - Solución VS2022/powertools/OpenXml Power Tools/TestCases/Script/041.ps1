##
##	Testcase 041
##	Get-OpenXmlFooter: Get the footers from a document without footers
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/041.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/041 ../Input
mkdir ../Output/041

##################
# Execute cmdlet #
##################

Get-OpenXmlFooter -Path ../Input/041/041.docx -FooterType Default

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/041.Ok

	# copy to outpufile
	copy ../Input/041/041.docx ../Output/041
}
else
{
	"process error" > ../Results/041.Nok
}