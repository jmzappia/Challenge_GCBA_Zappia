##
##	Testcase 100
##	Set theme on a document with no theme associated
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/100.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/100 ../Input 
mkdir ../Output/100

##################
# Execute cmdlet #
##################

Set-OpenXmlTheme -Path ../Input/100/100.docx -ThemePath ../Input/100/100.thmx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/100.Ok

	# copy to outpufile
	copy ../Input/100/100.docx ../Output/100
}
else
{
	"process error" > ../Results/100.Nok
}