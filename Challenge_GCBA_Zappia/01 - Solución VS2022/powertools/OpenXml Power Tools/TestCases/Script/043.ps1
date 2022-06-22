##
##	Testcase 043
##	Get-OpenXmlHeader: Get the headers from a document without headers
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/043.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/043 ../Input
mkdir ../Output/043

##################
# Execute cmdlet #
##################

Get-OpenXmlHeader -Path ../Input/043/043.docx -HeaderType Even

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/043.Ok

	# copy to outpufile
	copy ../Input/043/043.docx ../Output/043
}
else
{
	"process error" > ../Results/043.Nok
}