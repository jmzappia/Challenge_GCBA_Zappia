##
##	Testcase 096
##	Set a predefined document header and export the document to Html
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/096.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/096 ../Input 
mkdir ../Output/096

##################
# Execute cmdlet #
##################

Set-OpenXmlHeader -Path ../Input/096/096.docx -HeaderPath ../Input/096/header1.xml -HeaderType First -PassThru |
Set-OpenXmlHeader -HeaderPath ../Input/096/header2.xml -HeaderType Even -PassThru |
Set-OpenXmlHeader -HeaderPath ../Input/096/header3.xml -HeaderType Default -PassThru | 
Export-OpenXmlToHtml -Packing -ResourcesPackageName 096.zip -HtmlOutputName 096.html -XslPath ../Input/096/096.xsl -OutputPath ../Output/096

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/096.Ok

	# copy to outpufile
	copy ../Input/096/096.docx ../Output/096
}
else
{
	"process error" > ../Results/096.Nok
}