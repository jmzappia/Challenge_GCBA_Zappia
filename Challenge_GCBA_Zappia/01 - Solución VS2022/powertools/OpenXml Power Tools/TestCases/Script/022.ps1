##
##	Testcase 022
##	Export-OpenXmlToHtml: Export a rich wordprocessing file to a html package
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/022.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/022 ../Input
mkdir ../Output/022

##################
# Execute cmdlet #
##################

Export-OpenXmlToHtml -Packing -Path ../Input/022/022.docx -ResourcesPackageName 022.zip -HtmlOutputName 022.html -XslPath ../Input/022/022.xsl -OutputPath ../Output/022

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/022.Ok
}
else
{
	"process error" > ../Results/022.Nok
}