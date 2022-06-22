##
##	Testcase 111
##	Place a diagonal watermark in a document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/111.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/111 ../Input 
mkdir ../Output/111

##################
# Execute cmdlet #
##################

Set-OpenXmlWatermark -Path ../Input/111/111.docx -WatermarkText "Watermark text" -DiagonalOrientation

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/111.Ok

	# copy to outpufile
	copy ../Input/111/111.docx ../Output/111
}
else
{
	"process error" > ../Results/111.Nok
}