##
##	Testcase 118
##	Generate TOC for a document with titles
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/118.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/118 ../Input 
mkdir ../Output/118

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOC -Path ../Input/118/118.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/118.Ok

	# copy to outpufile
	copy ../Input/118/118.docx ../Output/118
}
else
{
	"process error" > ../Results/118.Nok
}