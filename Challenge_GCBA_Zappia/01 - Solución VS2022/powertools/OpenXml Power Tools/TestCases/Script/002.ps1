##
##	Testcase 002
##	Accept-OpenXmlChange: Test with additions/removals/movements of paragraphs and runs
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/002.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/002 ../Input
mkdir ../Output/002

##################
# Execute cmdlet #
##################

Accept-OpenXmlChange -Path ../Input/002/002.docx


###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/002.Ok

	# copy to outpufile
	copy ../Input/002/002.docx ../Output/002
}
else
{
	"process error" > ../Results/002.Nok
}