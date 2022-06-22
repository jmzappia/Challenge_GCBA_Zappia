##
##	Testcase 125
##	Generate TOA for an empty document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/125.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/125 ../Input 
mkdir ../Output/125

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOA -Path ../Input/125/125.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/125.Ok

	# copy to outpufile
	copy ../Input/125/125.docx ../Output/125
}
else
{
	"process error" > ../Results/125.Nok
}