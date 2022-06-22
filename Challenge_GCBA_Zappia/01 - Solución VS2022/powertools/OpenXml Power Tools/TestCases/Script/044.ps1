##
##	Testcase 044
##	Get-OpenXmlStyle: Get the style from a document with style definition
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/044.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/044 ../Input
mkdir ../Output/044

##################
# Execute cmdlet #
##################

Get-OpenXmlStyle -Path ../Input/044/044.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/044.Ok

	# copy to outpufile
	copy ../Input/044/044.docx ../Output/044
}
else
{
	"process error" > ../Results/044.Nok
}