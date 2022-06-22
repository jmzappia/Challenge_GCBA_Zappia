##
##	Testcase 126
##	Generate TOA for a document with authorities
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/126.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/126 ../Input 
mkdir ../Output/126

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOA -Path ../Input/126/126.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/126.Ok

	# copy to outpufile
	copy ../Input/126/126.docx ../Output/126
}
else
{
	"process error" > ../Results/126.Nok
}