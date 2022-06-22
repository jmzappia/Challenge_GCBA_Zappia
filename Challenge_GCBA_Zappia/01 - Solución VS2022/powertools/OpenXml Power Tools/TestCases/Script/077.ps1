##
##	Testcase 077
##	Set-OpenXmlCustomXmlData: Set customXml part to a document with no existing part with the same name
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/077.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/077 ../Input
mkdir ../Output/077

##################
# Execute cmdlet #
##################

Set-OpenXmlCustomXmlData -Path ../Input/077/077.docx -PartPath ../Input/077/nonexistingitem.xml

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/077.Ok

	# copy to outpufile
	copy ../Input/077/077.docx ../Output/077
}
else
{
	"process error" > ../Results/077.Nok
}