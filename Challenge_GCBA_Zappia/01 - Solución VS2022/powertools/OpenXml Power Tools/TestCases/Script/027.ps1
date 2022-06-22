##
##	Testcase 027
##	Export-OpenXmlToHtml: Export a rich wordprocessing file to a directory location with a valid xslt
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/027.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/027 ../Input
mkdir ../Output/027

##################
# Execute cmdlet #
##################

Export-OpenXmlToHtml -Path ../Input/027/027.docx -HtmlOutputName 027.html -XslPath ../Input/027/027.xsl -OutputPath ../Output/027


###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/027.Ok
}
else
{
	"process error" > ../Results/027.Nok
}