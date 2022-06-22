##
##	Testcase 122
##	Generate TOC for a document with TOC
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/122.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/122 ../Input 
mkdir ../Output/122

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOF -Path ../Input/122/122.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/122.Ok

	# copy to outpufile
	copy ../Input/122/122.docx ../Output/122
}
else
{
	"process error" > ../Results/122.Nok
}