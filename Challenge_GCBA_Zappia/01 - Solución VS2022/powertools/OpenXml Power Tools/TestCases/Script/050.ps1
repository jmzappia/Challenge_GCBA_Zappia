##
##	Testcase 050
##	Reject–OpenXmlChange: Reject changes from document with fo#rmat changes
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/050*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/050 ../Input
mkdir ../Output/050

##################
# Execute cmdlet #
##################

Reject-OpenXmlChange -Path ../Input/050/050.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/050.Ok
	# copy to outpufile
	copy ../Input/050/050.docx ../Output/050
}
else
{
	"process error" > ../Results/050.Nok
}