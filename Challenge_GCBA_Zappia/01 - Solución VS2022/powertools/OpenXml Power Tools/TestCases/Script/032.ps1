##
##	Testcase 032
##	Get-OpenXmlBackground: Get background from a document without any kind of background
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/032.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/032 ../Input
mkdir ../Output/032

##################
# Execute cmdlet #
##################

Get-OpenXmlBackground -Path ../Input/032/032.docx -Color

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/032.Ok

	# copy to outpufile
	copy ../Input/032/032.docx ../Output/032
}
else
{
	"process error" > ../Results/032.Nok
}