##
##	Testcase 003
##	Accept-OpenXmlChange: Test with changes in customXml
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/003.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/003 ../Input
mkdir ../Output/003

##################
# Execute cmdlet #
##################

Accept-OpenXmlChange -Path ../Input/003/003.docx


###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/003.Ok

	# copy to outpufile
	copy ../Input/003/003.docx ../Output/003
}
else
{
	"process error" > ../Results/003.Nok
}