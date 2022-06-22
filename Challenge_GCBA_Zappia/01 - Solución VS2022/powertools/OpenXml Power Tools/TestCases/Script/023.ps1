##
##	Testcase 023
##	Export-OpenXmlToHtml: Export a rich wordprocessing file to a directory location
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/023.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/023 ../Input
mkdir ../Output/023

##################
# Execute cmdlet #
##################

Export-OpenXmlToHtml -Path ../Input/023/023.docx -HtmlOutputName 023.html -XslPath ../Input/023/023.xsl -OutputPath ../Output/023


###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/023.Ok
}
else
{
	"process error" > ../Results/023.Nok
}