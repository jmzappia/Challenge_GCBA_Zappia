##
##	Testcase 028
##	Export-OpenXmlToHtml: Export a rich wordprocessing file into a package using an invalid xslt
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/028.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/028 ../Input
mkdir ../Output/028

##################
# Execute cmdlet #
##################

Export-OpenXmlToHtml -Packing -Path ../Input/028/028.docx -ResourcesPackageName 028.zip -HtmlOutputName 028.html -XslPath ../Input/028/028.xsl -OutputPath ../Output/028 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Invalid XSLT'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/028.Ok
}
else
{
	"process error" > ../Results/028.Nok
}