##
##	Testcase 074
##	Set-OpenXmlContentStyle: Set valid content style to a location other than a run or paragraph
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/074.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/074 ../Input
mkdir ../Output/074

##################
# Execute cmdlet #
##################

Set-OpenXmlContentStyle -Path ../Input/074/074.docx -InsertionPoint '/w:document/w:body' -StyleName 'Title' -StylesSourcePath ../Input/074/styles.xml 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'The xpath query did not return a valid location'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/074.Ok

	# copy to outpufile
	copy ../Input/074/074.docx ../Output/074
}
else
{
	"process error" > ../Results/074.Nok
}