##
##	Testcase 123
##	Generate TOC for a document with TOC
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/123.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/123 ../Input 
mkdir ../Output/123

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOF -Path ../Input/123/123.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/123.Ok

	# copy to outpufile
	copy ../Input/123/123.docx ../Output/123
}
else
{
	"process error" > ../Results/123.Nok
}