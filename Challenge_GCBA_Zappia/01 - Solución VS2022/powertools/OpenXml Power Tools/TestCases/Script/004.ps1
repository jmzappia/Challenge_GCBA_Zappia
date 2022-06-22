##
##	Testcase 004
##	Accept-OpenXmlChange: Test with changes in tables, pictures, rich content
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/004.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/004 ../Input
mkdir ../Output/004

##################
# Execute cmdlet #
##################

Accept-OpenXmlChange -Path ../Input/004/004.docx


###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/004.Ok

	# copy to outpufile
	copy ../Input/004/004.docx ../Output/004
}
else
{
	"process error" > ../Results/004.Nok
}