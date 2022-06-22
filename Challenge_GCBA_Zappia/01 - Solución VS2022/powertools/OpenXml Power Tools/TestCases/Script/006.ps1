##
##	Testcase 006
##	Add-OpenXmlContent: Try to add content to nonexisting parts
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/006.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/006 ../Input
mkdir ../Output/006

##################
# Execute cmdlet #
##################

Add-OpenXmlContent -Path ../Input/006/006.docx -PartPath '/word/mypart.xml'  -InsertionPoint '/w:document/w:body' -Content '<w:p><w:r><w:t>This is the new content.</w:t>/w:r></w:p>' 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Specified part does not exist.'" -ForegroundColor Yellow
###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/006.Ok

	# copy to outpufile
	copy ../Input/006/006.docx ../Output/006
}
else
{
	"process error" > ../Results/006.Nok
}