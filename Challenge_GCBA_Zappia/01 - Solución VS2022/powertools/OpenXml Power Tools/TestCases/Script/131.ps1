##
##	Testcase 131
##	Generate index for a document with no index entries
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/131.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/131 ../Input 
mkdir ../Output/131

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOA -Path ../Input/131/131.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/131.Ok

	# copy to outpufile
	copy ../Input/131/131.docx ../Output/131
}
else
{
	"process error" > ../Results/131.Nok
}