##
##	Testcase 005
##	Add-OpenXmlContent: Add content to several parts
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/005.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/005 ../Input
mkdir ../Output/005

##################
# Execute cmdlet #
##################

Add-OpenXmlContent -Path ../Input/005/005.docx -PartPath '/word/document.xml',/word/styles.xml  -InsertionPoint '/w:document/w:body/*[1]|/w:styles/w:style[1]' -Content '<w:p><w:r><w:t>This is the new content.</w:t></w:r></w:p>'

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/005.Ok

	# copy to outpufile
	copy ../Input/005/005.docx ../Output/005
}
else
{
	"process error" > ../Results/005.Nok
}