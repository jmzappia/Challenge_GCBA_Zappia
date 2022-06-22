##
##	Testcase 105
##	Split documents without sections breaks
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/105.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/105 ../Input 
mkdir ../Output/105

##################
# Execute cmdlet #
##################

Split-OpenXmlDocument -Path ../Input/105/105.docx -OutputPath "../Output/105" -Prefix "Split105"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/105.Ok

	# copy to outpufile
	copy ../Input/105/105* ../Output/105
}
else
{
	"process error" > ../Results/105.Nok
}