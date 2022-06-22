##
##	Testcase 058
##	Set-OpenXmlBackground: Set picture background to document with picture background
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/058.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/058 ../Input
mkdir ../Output/058

##################
# Execute cmdlet #
##################

Set-OpenXmlBackground -Path ../Input/058/058.docx -ImagePath ../Input/058/058.jpg

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/058.Ok

	# copy to outpufile
	copy ../Input/058/058.docx ../Output/058
}
else
{
	"process error" > ../Results/058.Nok
}