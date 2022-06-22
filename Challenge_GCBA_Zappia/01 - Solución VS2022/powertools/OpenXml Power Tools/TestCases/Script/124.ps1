##
##	Testcase 124
##	Generate TOC for a document with TOC
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/124.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/124 ../Input 
mkdir ../Output/124

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOF -Path ../Input/124/124.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/124.Ok

	# copy to outpufile
	copy ../Input/124/124.docx ../Output/124
}
else
{
	"process error" > ../Results/124.Nok
}