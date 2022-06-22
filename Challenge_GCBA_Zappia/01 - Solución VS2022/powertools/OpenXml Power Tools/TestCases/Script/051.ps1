##
##	Testcase 051
##	Reject–OpenXmlChange: Reject changes from document with rich content changes
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/051*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/051 ../Input
mkdir ../Output/051

##################
# Execute cmdlet #
##################

Reject-OpenXmlChange -Path ../Input/051/051.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/051.Ok
	# copy to outpufile
	copy ../Input/051/051.docx ../Output/051
}
else
{
	"process error" > ../Results/051.Nok
}