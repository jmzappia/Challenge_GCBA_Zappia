##
##	Testcase 108
##	Get the document watermark
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/108.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/108 ../Input 
mkdir ../Output/108

##################
# Execute cmdlet #
##################

Get-OpenXmlWatermark -Path ../Input/108/108.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/108.Ok

	# copy to outpufile
	copy ../Input/108/108.docx ../Output/108
}
else
{
	"process error" > ../Results/108.Nok
}