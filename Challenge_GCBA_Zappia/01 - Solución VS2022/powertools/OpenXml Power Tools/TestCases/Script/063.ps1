##
##	Testcase 063
##	Set-OpenXmlBackground: Set color background with invalid color fo#rmat
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/063.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/063 ../Input
mkdir ../Output/063

##################
# Execute cmdlet #
##################

Set-OpenXmlBackground -Path ../Input/063/063.docx -ColorName 'GHIJKL' 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Could not find any recognizable digits.'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/063.Ok

	# copy to outpufile
	copy ../Input/063/063.docx ../Output/063
}
else
{
	"process error" > ../Results/063.Nok
}