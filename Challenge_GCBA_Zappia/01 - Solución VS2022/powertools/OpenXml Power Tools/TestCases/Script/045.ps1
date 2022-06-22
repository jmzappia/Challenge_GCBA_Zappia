##
##	Testcase 045
##	Get-OpenXmlStyle: Get the style from a document without style definition
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/045.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/045 ../Input
mkdir ../Output/045

##################
# Execute cmdlet #
##################

Get-OpenXmlStyle -Path ../Input/045/045.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/045.Ok

	# copy to outpufile
	copy ../Input/045/045.docx ../Output/045
}
else
{
	"process error" > ../Results/045.Nok
}