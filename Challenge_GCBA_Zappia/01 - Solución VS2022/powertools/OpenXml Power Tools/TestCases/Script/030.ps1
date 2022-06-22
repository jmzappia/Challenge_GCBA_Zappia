##
##	Testcase 030
##	Get-OpenXmlBackground: Get background from a document with picture background
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/030.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/030 ../Input
mkdir ../Output/030

##################
# Execute cmdlet #
##################

Get-OpenXmlBackground -Path ../Input/030/030.docx -Image

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/030.Ok

	# copy to outpufile
	copy ../Input/030/030.docx ../Output/030
}
else
{
	"process error" > ../Results/030.Nok
}