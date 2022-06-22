##
##	Testcase 119
##	Generate TOC for a document with no titles
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/119.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/119 ../Input 
mkdir ../Output/119

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOC -Path ../Input/119/119.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/119.Ok

	# copy to outpufile
	copy ../Input/119/119.docx ../Output/119
}
else
{
	"process error" > ../Results/119.Nok
}