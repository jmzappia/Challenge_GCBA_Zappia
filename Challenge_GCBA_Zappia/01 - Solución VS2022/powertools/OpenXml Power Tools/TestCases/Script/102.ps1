##
##	Testcase 102
##	Set theme on a document to Get-OpenXmlTheme output
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/102.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/102 ../Input 
mkdir ../Output/102

##################
# Execute cmdlet #
##################

Get-OpenXmlTheme -Path ../Input/102/102Get.docx -OutputPath "../Input/102/102.thmx"
Set-OpenXmlTheme -Path ../Input/102/102Set.docx -ThemePath "../Input/102/102.thmx"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/102.Ok

	# copy to outpufile
	copy ../Input/102/102* ../Output/102
}
else
{
	"process error" > ../Results/102.Nok
}