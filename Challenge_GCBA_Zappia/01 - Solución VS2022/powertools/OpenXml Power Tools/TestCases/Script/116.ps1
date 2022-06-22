##
##	Testcase 116
##	Insert an invalid picture
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/116.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/116 ../Input 
mkdir ../Output/116

##################
# Execute cmdlet #
##################

Add-OpenXmlPicture -Path ../Input/116/116.docx -InsertionPoint "//w:p[1]" -PicturePath ../Input/116/invalidPicture.jpg 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Invalid picture file.'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/116.Ok

	# copy to outpufile
	copy ../Input/116/116.docx ../Output/116
}
else
{
	"process error" > ../Results/116.Nok
}