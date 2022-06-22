##
##	Testcase 029
##	Export-OpenXmlToHtml: Export a rich wordprocessing file to a directory location using an invalid xslt
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/029.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/029 ../Input
mkdir ../Output/029

##################
# Execute cmdlet #
##################

Export-OpenXmlToHtml -Path ../Input/029/029.docx -HtmlOutputName 029.html -XslPath ../Input/029/029.xsl -OutputPath ../Output/029 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Invalid XSLT'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/029.Ok
}
else
{
	"process error" > ../Results/029.Nok
}