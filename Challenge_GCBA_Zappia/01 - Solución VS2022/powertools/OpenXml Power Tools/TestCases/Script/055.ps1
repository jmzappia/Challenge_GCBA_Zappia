##
##	Testcase 055
##	Remove-OpenXmlComment: Remove comments from document with no comments
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/055*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/055 ../Input
mkdir ../Output/055

##################
# Execute cmdlet #
##################

Remove-OpenXmlComment -Path ../Input/055/055.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/055.Ok
	# copy to outpufile
	copy ../Input/055/055.docx ../Output/055
}
else
{
	"process error" > ../Results/055.Nok
}