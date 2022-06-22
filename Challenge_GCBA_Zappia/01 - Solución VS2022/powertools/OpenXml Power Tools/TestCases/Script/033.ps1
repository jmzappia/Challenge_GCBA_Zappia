##
##	Testcase 033
##	Get-OpenXmlCustomXmlData: Get a customXml data part
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/033.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/033 ../Input
mkdir ../Output/033

##################
# Execute cmdlet #
##################

Get-OpenXmlCustomXmlData -Path ../Input/033/033.docx -Part item1.xml

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/033.Ok

	# copy to outpufile
	copy ../Input/033/033.docx ../Output/033
}
else
{
	"process error" > ../Results/033.Nok
}