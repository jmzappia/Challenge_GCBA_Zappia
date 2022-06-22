##
##	Testcase 117
##	Generate TOC for an empty document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/117.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/117 ../Input 
mkdir ../Output/117

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOC -Path ../Input/117/117.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/117.Ok

	# copy to outpufile
	copy ../Input/117/117.docx ../Output/117
}
else
{
	"process error" > ../Results/117.Nok
}