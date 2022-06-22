##
##	Testcase 047
##	Lock-OpenXmlDocument: Lock an unlocked document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/047*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/047 ../Input
mkdir ../Output/047

##################
# Execute cmdlet #
##################

Lock-OpenXmlDocument -Path ../Input/047/047.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/047.Ok
	# copy to outpufile
	copy ../Input/047/047.docx ../Output/047
}
else
{
	"process error" > ../Results/047.Nok
}