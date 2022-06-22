##
##	Testcase 048
##	Lock-OpenXmlDocument: Lock an already locked document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/048*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/048 ../Input
mkdir ../Output/048

##################
# Execute cmdlet #
##################

Lock-OpenXmlDocument -Path ../Input/048/048.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/048.Ok
	# copy to outpufile
	copy ../Input/048/048.docx ../Output/048
}
else
{
	"process error" > ../Results/048.Nok
}