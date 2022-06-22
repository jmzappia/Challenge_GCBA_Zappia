##
##	Testcase 101
##	Set theme on a document with a theme associated
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/101.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/101 ../Input 
mkdir ../Output/101

##################
# Execute cmdlet #
##################

Set-OpenXmlTheme -Path ../Input/101/101.docx -ThemePath ../Input/101/101.thmx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/101.Ok

	# copy to outpufile
	copy ../Input/101/101.docx ../Output/101
}
else
{
	"process error" > ../Results/101.Nok
}