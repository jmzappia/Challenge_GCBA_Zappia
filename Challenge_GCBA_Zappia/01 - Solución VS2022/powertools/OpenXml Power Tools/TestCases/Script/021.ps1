##
##	Testcase 021
##	Export-OpenXmlToHtml: Export a flat wordprocessing file to a directory location
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/021.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/021 ../Input
mkdir ../Output/021

##################
# Execute cmdlet #
##################

Export-OpenXmlToHtml -Path ../Input/021/021.docx -HtmlOutputName 021.html -XslPath ../Input/021/021.xsl -OutputPath ../Output/021


###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/021.Ok
}
else
{
	"process error" > ../Results/021.Nok
}