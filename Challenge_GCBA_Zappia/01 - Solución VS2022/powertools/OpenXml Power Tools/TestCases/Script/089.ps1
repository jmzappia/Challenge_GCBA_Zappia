##
##	Testcase 089
##	Remove comments from a document and add a custom paragraph at the beginning
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/089.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/089 ../Input
mkdir ../Output/089

##################
# Execute cmdlet #
##################

Remove-OpenXmlComment -Path ../Input/089/089.docx -PassThru |
Add-OpenXmlContent -PartPath '/word/document.xml'  -InsertionPoint '/w:document/w:body/w:p[1]' -Content '<w:p><w:r><w:t>This is the new content.</w:t></w:r></w:p>'

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/089.Ok

	# copy to outpufile
	copy ../Input/089/089.docx ../Output/089
}
else
{
	"process error" > ../Results/089.Nok
}