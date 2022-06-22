##
##	Testcase 087
##	Set-OpenXmlStyle: Set invalid style to a file
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/087.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/087 ../Input
mkdir ../Output/087

##################
# Execute cmdlet #
##################

Set-OpenXmlStyle -Path ../Input/087/087.docx -StylePath ../Input/087/styles.xml 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'File specified is not a valid XML file'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/087.Ok

	# copy to outpufile
	copy ../Input/087/087.docx ../Output/087
}
else
{
	"process error" > ../Results/087.Nok
}