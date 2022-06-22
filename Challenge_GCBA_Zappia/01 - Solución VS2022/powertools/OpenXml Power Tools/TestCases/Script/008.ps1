##
##	Testcase 008
##	Add-OpenXmlContent: Try to add content to invalid locations inside a part
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/008.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/008 ../Input
mkdir ../Output/008

##################
# Execute cmdlet #
##################

Add-OpenXmlContent -Path ../Input/008/008.docx -PartPath '/word/document.xml' -InsertionPoint '/w:document/w:body/w:p[3]' -Content '<w:p><w:r><w:t>This is the new content.</w:t></w:r></w:p>' 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Insertion point does not exist'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/008.Ok

	# copy to outpufile
	copy ../Input/008/008.docx ../Output/008
}
else
{
	"process error" > ../Results/008.Nok
}