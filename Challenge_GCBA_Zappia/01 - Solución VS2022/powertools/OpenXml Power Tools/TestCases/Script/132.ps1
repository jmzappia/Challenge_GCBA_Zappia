##
##	Testcase 132
##	Generate index for a document with index
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/132.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/132 ../Input 
mkdir ../Output/132

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentIndex -Path ../Input/132/132.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/132.Ok

	# copy to outpufile
	copy ../Input/132/132.docx ../Output/132
}
else
{
	"process error" > ../Results/132.Nok
}