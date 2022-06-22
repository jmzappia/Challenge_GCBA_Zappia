##
##	Testcase 106
##	Split documents with sections breaks
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/106.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/106 ../Input 
mkdir ../Output/106

##################
# Execute cmdlet #
##################

Split-OpenXmlDocument -Path ../Input/106/106.docx -OutputPath "../Output/106" -Prefix "Split106"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/106.Ok

	# copy to outpufile
	copy ../Input/106/106* ../Output/106
}
else
{
	"process error" > ../Results/106.Nok
}