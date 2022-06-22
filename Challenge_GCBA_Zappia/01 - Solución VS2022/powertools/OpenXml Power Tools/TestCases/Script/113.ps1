##
##	Testcase 113
##	Insert a picture inside a document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/113.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/113 ../Input 
mkdir ../Output/113

##################
# Execute cmdlet #
##################

Add-OpenXmlPicture -Path ../Input/113/113.docx -InsertionPoint "//w:p[1]" -PicturePath ../Input/113/picture.jpg

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/113.Ok

	# copy to outpufile
	copy ../Input/113/113.docx ../Output/113
}
else
{
	"process error" > ../Results/113.Nok
}