##
##	Testcase 107
##	Split an empty document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/107.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/107 ../Input 
mkdir ../Output/107

##################
# Execute cmdlet #
##################

Split-OpenXmlDocument -Path ../Input/107/107.docx -OutputPath "../Output/107" -Prefix "Split107"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/107.Ok

	# copy to outpufile
	copy ../Input/107/107* ../Output/107
}
else
{
	"process error" > ../Results/107.Nok
}