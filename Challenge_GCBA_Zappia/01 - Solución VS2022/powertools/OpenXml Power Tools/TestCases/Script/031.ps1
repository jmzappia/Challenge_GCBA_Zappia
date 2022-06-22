##
##	Testcase 031
##	Get-OpenXmlBackground: Get background from a document with color background
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/031.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/031 ../Input
mkdir ../Output/031

##################
# Execute cmdlet #
##################

Get-OpenXmlBackground -Path ../Input/031/031.docx -Color

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/031.Ok

	# copy to outpufile
	copy ../Input/031/031.docx ../Output/031
}
else
{
	"process error" > ../Results/031.Nok
}