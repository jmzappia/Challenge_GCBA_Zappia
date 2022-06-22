##
##	Testcase 109
##	Get the document watermark in a document without watermark
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/109.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/109 ../Input 
mkdir ../Output/109

##################
# Execute cmdlet #
##################

Get-OpenXmlWatermark -Path "../Input/109/109.docx"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/109.Ok

	# copy to outpufile
	copy ../Input/109/109.docx ../Output/109
}
else
{
	"process error" > ../Results/109.Nok
}