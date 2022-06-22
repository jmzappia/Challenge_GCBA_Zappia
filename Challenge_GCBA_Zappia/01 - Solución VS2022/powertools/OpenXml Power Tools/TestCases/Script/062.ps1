##
##	Testcase 062
##	Set-OpenXmlBackground: Set color background to document with picture background
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/062.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/062 ../Input
mkdir ../Output/062

##################
# Execute cmdlet #
##################

Set-OpenXmlBackground -Path ../Input/062/062.docx -ColorName '4BACC6'

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/062.Ok

	# copy to outpufile
	copy ../Input/062/062.docx ../Output/062
}
else
{
	"process error" > ../Results/062.Nok
}