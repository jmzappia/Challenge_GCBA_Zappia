##
##	Testcase 020
##	Export-OpenXmlToHtml: Export a flat wordprocessing file to a html package
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/020.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/020 ../Input
mkdir ../Output/020

##################
# Execute cmdlet #
##################

Export-OpenXmlToHtml -Packing -Path ../Input/020/020.docx -ResourcesPackageName 020.zip -HtmlOutputName 020.html -XslPath ../Input/020/020.xsl -OutputPath ../Output/020


###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/020.Ok
}
else
{
	"process error" > ../Results/020.Nok
}