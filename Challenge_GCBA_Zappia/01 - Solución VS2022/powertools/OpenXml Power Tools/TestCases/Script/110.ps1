##
##	Testcase 110
##	Place a watermark in a document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/110.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/110 ../Input 
mkdir ../Output/110

##################
# Execute cmdlet #
##################

Set-OpenXmlWatermark -Path ../Input/110/110.docx -WatermarkText "Watermark text"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/110.Ok

	# copy to outpufile
	copy ../Input/110/110.docx ../Output/110
}
else
{
	"process error" > ../Results/110.Nok
}