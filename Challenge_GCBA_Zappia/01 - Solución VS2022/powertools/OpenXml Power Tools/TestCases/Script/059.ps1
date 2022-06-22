##
##	Testcase 059
##	Set-OpenXmlBackground: Set picture background with invalid picture format
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/059.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/059 ../Input
mkdir ../Output/059

##################
# Execute cmdlet #
##################

Set-OpenXmlBackground -Path ../Input/059/059.docx -ImagePath ../Input/059/059.pdf 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Invalid picture file.'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/059.Ok

	# copy to outpufile
	copy ../Input/059/059.docx ../Output/059
}
else
{
	"process error" > ../Results/059.Nok
}