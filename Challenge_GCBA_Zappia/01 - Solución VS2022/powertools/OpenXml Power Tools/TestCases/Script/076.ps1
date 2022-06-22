##
##	Testcase 076
##	Set-OpenXmlCustomXmlData: Set customXml part to a document with existing part with the same name
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/076.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/076 ../Input
mkdir ../Output/076

##################
# Execute cmdlet #
##################

Set-OpenXmlCustomXmlData -Path ../Input/076/076.docx -PartPath ../Input/076/item1.xml

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/076.Ok

	# copy to outpufile
	copy ../Input/076/076.docx ../Output/076
}
else
{
	"process error" > ../Results/076.Nok
}