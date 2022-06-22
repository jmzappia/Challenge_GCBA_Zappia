##
##	Testcase 025
##	Export-OpenXmlToHtml: Export a flat wordprocessing file to a directory location with a valid xslt
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/025.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/025 ../Input
mkdir ../Output/025

##################
# Execute cmdlet #
##################

Export-OpenXmlToHtml -Path ../Input/025/025.docx -HtmlOutputName 025.html -XslPath ../Input/025/025.xsl -OutputPath ../Output/025


###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/025.Ok
}
else
{
	"process error" > ../Results/025.Nok
}