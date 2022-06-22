##
##	Testcase 120
##	Generate TOC for a document with TOC
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/120.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/120 ../Input 
mkdir ../Output/120

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOC -Path ../Input/120/120.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/120.Ok

	# copy to outpufile
	copy ../Input/120/120.docx ../Output/120
}
else
{
	"process error" > ../Results/120.Nok
}