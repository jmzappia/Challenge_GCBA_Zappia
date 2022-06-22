##
##	Testcase 054
##	Remove-OpenXmlComment: Remove comments from document with comments
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/054*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/054 ../Input
mkdir ../Output/054

##################
# Execute cmdlet #
##################

Remove-OpenXmlComment -Path ../Input/054/054.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/054.Ok
	# copy to outpufile
	copy ../Input/054/054.docx ../Output/054
}
else
{
	"process error" > ../Results/054.Nok
}