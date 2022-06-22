##
##	Testcase 042
##	Get-OpenXmlHeader: Get the headers from a document with headers
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/042.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/042 ../Input
mkdir ../Output/042

##################
# Execute cmdlet #
##################

Get-OpenXmlHeader -Path ../Input/042/042.docx -HeaderType Even

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/042.Ok

	# copy to outpufile
	copy ../Input/042/042.docx ../Output/042
}
else
{
	"process error" > ../Results/042.Nok
}