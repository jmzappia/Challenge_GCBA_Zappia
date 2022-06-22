##
##	Testcase 007
##	Add-OpenXmlContent: Try to add invalid content to a part (binary content, bad formed xml, xml referencing unrelated namespaces…)
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/007.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/007 ../Input
mkdir ../Output/007

##################
# Execute cmdlet #
##################

Add-OpenXmlContent -Path ../Input/007/007.docx -PartPath '/word/document.xml' -InsertionPoint '/w:document/w:body' -Content '<w:p>:r><w:t>This is the new content.</w:t></w:r></w:p>' 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Bad formed XML file or fragment.'" -ForegroundColor Yellow
###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/007.Ok

	# copy to outpufile
	copy ../Input/007/007.docx ../Output/007
}
else
{
	"process error" > ../Results/007.Nok
}