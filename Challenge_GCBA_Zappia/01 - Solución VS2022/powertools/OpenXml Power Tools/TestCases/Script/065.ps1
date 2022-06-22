##
##	Testcase 065
##	Set-OpenXmlContentFormat: Set valid format to a paragraph with defined format

##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/065.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/065 ../Input
mkdir ../Output/065

##################
# Execute cmdlet #
##################

Set-OpenXmlContentFormat -Path ../Input/065/065.docx -Content '<w:jc w:val="right" />' -InsertionPoint /w:document/w:body/w:p[1]

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/065.Ok

	# copy to outpufile
	copy ../Input/065/065.docx ../Output/065
}
else
{
	"process error" > ../Results/065.Nok
}