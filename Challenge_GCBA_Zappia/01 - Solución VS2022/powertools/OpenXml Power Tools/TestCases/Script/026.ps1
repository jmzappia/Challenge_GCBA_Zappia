##
##	Testcase 026
##	Export-OpenXmlToHtml: Export a rich wordprocessing file into a package using a valid xslt
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/026.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/026 ../Input
mkdir ../Output/026

##################
# Execute cmdlet #
##################

Export-OpenXmlToHtml -Packing -Path ../Input/026/026.docx -ResourcesPackageName 026.zip -HtmlOutputName 026.html -XslPath ../Input/026/026.xsl -OutputPath ../Output/026

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/026.Ok
}
else
{
	"process error" > ../Results/026.Nok
}