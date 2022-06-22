##
##	Testcase 130
##	Generate index for a document with index entries
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/130.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/130 ../Input 
mkdir ../Output/130

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentIndex -Path ../Input/130/130.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/130.Ok

	# copy to outpufile
	copy ../Input/130/130.docx ../Output/130
}
else
{
	"process error" > ../Results/130.Nok
}