##
##	Testcase 114
##	Insert a picture into an invalid location inside the document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/114.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/114 ../Input 
mkdir ../Output/114

##################
# Execute cmdlet #
##################

Add-OpenXmlPicture -Path ../Input/114/114.docx -InsertionPoint "//w:p[5]" -PicturePath ../Input/114/picture.jpg 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'The xpath query did not return a valid location.'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/114.Ok

	# copy to outpufile
	copy ../Input/114/114.docx ../Output/114
}
else
{
	"process error" > ../Results/114.Nok
}