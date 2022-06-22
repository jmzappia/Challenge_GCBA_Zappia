##
##	Testcase 053
##	Reject–OpenXmlChange: Reject changes from document with no changes
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/053*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/053 ../Input
mkdir ../Output/053

##################
# Execute cmdlet #
##################

Reject-OpenXmlChange -Path ../Input/053/053.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/053.Ok
	# copy to outpufile
	copy ../Input/053/053.docx ../Output/053
}
else
{
	"process error" > ../Results/053.Nok
}