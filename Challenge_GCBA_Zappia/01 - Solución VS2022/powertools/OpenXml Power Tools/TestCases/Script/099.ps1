##
##	Testcase 099
##	Get theme from a document with no theme associated
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/099.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/099 ../Input 
mkdir ../Output/099

##################
# Execute cmdlet #
##################

Get-OpenXmlTheme -Path ../Input/099/099.docx -OutputPath "../Input/099/099.thmx"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/099.Ok

	# copy to outpufile
	copy ../Input/099/099.docx ../Output/099
}
else
{
	"process error" > ../Results/099.Nok
}