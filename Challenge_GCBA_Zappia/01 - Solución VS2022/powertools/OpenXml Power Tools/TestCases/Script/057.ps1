##
##	Testcase 057
##	Set-OpenXmlBackground: Set picture background to document with color background
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/057.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/057 ../Input
mkdir ../Output/057

##################
# Execute cmdlet #
##################

Set-OpenXmlBackground -Path ../Input/057/057.docx -ImagePath ../Input/057/057.jpg

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/057.Ok

	# copy to outpufile
	copy ../Input/057/057.docx ../Output/057
}
else
{
	"process error" > ../Results/057.Nok
}