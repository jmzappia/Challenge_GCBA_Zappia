##
##	Testcase 068
##	Set-OpenXmlContentFormat: Set valid format to a location other than a run or paragraph
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/068.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/068 ../Input -Force
mkdir ../Output/068 -Force

##################
# Execute cmdlet #
##################

Set-OpenXmlContentFormat -Path ../Input/068/068.docx -Content '<w:b/><w:u w:val="single" />' -InsertionPoint '/w:document/w:body' 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Specified xpath query result is not a valid location to place formatting markup'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/068.Ok

	# copy to outpufile
	copy ../Input/068/068.docx ../Output/068
}
else
{
	"process error" > ../Results/068.Nok
}