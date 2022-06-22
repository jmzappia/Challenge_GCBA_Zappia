##
##	Testcase 024
##	Export-OpenXmlToHtml: Export a flat wordprocessing file into a package using a valid xslt
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/024.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/024 ../Input
mkdir ../Output/024

##################
# Execute cmdlet #
##################

Export-OpenXmlToHtml -Packing -Path ../Input/024/024.docx -ResourcesPackageName 024.zip -HtmlOutputName 024.html -XslPath ../Input/024/024.xsl -OutputPath ../Output/024


###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/024.Ok
}
else
{
	"process error" > ../Results/024.Nok
}