##
##	Testcase 128
##	Generate TOA for a document with TOA
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/128.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/128 ../Input 
mkdir ../Output/128

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOA -Path ../Input/128/128.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/128.Ok

	# copy to outpufile
	copy ../Input/128/128.docx ../Output/128
}
else
{
	"process error" > ../Results/128.Nok
}