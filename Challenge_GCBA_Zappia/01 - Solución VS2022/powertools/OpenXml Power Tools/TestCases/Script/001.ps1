##
##	Testcase 001
##	Accept-OpenXmlChange:  Test a document without changes
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/001.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/001 ../Input
mkdir ../Output/001

##################
# Execute cmdlet #
##################

Accept-OpenXmlChange -Path ../Input/001/001.docx


###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/001.Ok

	# copy to outpufile
	copy ../Input/001/001.docx ../Output/001
}
else
{
	"process error" > ../Results/001.Nok
}