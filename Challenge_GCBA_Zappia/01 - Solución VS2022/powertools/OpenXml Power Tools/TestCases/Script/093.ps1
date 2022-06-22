##
##	Testcase 093
##	Copy customXml content from a document to another
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/093.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/093 ../Input 
mkdir ../Output/093
`
##################
# Execute cmdlet #
##################
Get-OpenXmlCustomXmlData -Path ../Input/093/093Get.docx -Part "item1.xml" |
Set-OpenXmlCustomXmlData -Path ../Input/093/093Set.docx -PartName "item1.xml"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/093.Ok

	# copy to outpufile
	copy ../Input/093/093Set.docx ../Output/093
}
else
{
	"process error" > ../Results/093.Nok
}