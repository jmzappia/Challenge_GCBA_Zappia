##
##	Testcase 121
##	Generate TOF for an empty document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/121.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/121 ../Input 
mkdir ../Output/121

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOF -Path ../Input/121/121.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/121.Ok

	# copy to outpufile
	copy ../Input/121/121.docx ../Output/121
}
else
{
	"process error" > ../Results/121.Nok
}