##
##	Testcase 049
##	Reject–OpenXmlChange: Reject changes from document with text content changes
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/049*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/049 ../Input
mkdir ../Output/049

##################
# Execute cmdlet #
##################

Reject-OpenXmlChange -Path ../Input/049/049.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/049.Ok
	# copy to outpufile
	copy ../Input/049/049.docx ../Output/049
}
else
{
	"process error" > ../Results/049.Nok
}