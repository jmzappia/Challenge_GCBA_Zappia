##
##	Testcase 115
##	Insert a picture inside an empty document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/115.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/115 ../Input 
mkdir ../Output/115

##################
# Execute cmdlet #
##################

Add-OpenXmlPicture -Path ../Input/115/115.docx -InsertionPoint "//w:p[1]" -PicturePath ../Input/115/picture.jpg

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/115.Ok

	# copy to outpufile
	copy ../Input/115/115.docx ../Output/115
}
else
{
	"process error" > ../Results/115.Nok
}