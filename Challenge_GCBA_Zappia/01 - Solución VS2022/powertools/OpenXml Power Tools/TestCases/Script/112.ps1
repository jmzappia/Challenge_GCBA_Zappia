##
##	Testcase 112
##	Place a watermark in a document that already have a watermark
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/112.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/112 ../Input 
mkdir ../Output/112

##################
# Execute cmdlet #
##################

Set-OpenXmlWatermark -Path ../Input/112/112.docx -WatermarkText "Watermark text"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/112.Ok

	# copy to outpufile
	copy ../Input/112/112.docx ../Output/112
}
else
{
	"process error" > ../Results/112.Nok
}