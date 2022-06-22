##
##	Testcase 079
##	Set-OpenXmlCustomXmlData: Set customXml part to a document with no customXml parts
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/079.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/079 ../Input
mkdir ../Output/079

##################
# Execute cmdlet #
##################

Set-OpenXmlCustomXmlData -Path ../Input/079/079.docx -PartPath ../Input/079/item1.xml

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/079.Ok

	# copy to outpufile
	copy ../Input/079/079.docx ../Output/079
}
else
{
	"process error" > ../Results/079.Nok
}