##
##	Testcase 052
##	Reject–OpenXmlChange: Reject changes from document with custom xml changes 
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/052*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/052 ../Input
mkdir ../Output/052

##################
# Execute cmdlet #
##################

Reject-OpenXmlChange -Path ../Input/052/052.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/052.Ok
	# copy to outpufile
	copy ../Input/052/052.docx ../Output/052
}
else
{
	"process error" > ../Results/052.Nok
}