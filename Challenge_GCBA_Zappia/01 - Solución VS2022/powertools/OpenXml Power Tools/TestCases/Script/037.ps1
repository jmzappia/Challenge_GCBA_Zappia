##
##	Testcase 037
##	Get-OpenXmlDocument: Get a document from a well-formed file
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/037.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/037 ../Input
mkdir ../Output/037

##################
# Execute cmdlet #
##################

$doc = Get-OpenXmlDocument -Path ../Input/037/037.docx
$doc.Close()

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/037.Ok

	# copy to outpufile
	copy ../Input/037/037.docx ../Output/037
}
else
{
	"process error" > ../Results/037.Nok
}