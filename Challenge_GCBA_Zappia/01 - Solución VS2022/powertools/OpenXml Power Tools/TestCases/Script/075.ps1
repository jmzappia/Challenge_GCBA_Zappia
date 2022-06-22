##
##	Testcase 075
##	Set-OpenXmlContentStyle: Set invalid content style to a run or paragraph
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/075.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/075 ../Input
mkdir ../Output/075

##################
# Execute cmdlet #
##################

Set-OpenXmlContentStyle -Path ../Input/075/075.docx -InsertionPoint '/w:document/w:body/w:p[1]' -StyleName 'InvalidStyle' -StylesSourcePath ../Input/075/styles.xml 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Style or dependencies not found in the given style library.'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/075.Ok

	# copy to outpufile
	copy ../Input/075/075.docx ../Output/075
}
else
{
	"process error" > ../Results/075.Nok
}