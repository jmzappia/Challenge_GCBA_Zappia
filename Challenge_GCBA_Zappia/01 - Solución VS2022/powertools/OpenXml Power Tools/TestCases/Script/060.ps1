##
##	Testcase 060
##	Set-OpenXmlBackground: Set color background to document with no background
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/060.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/060 ../Input
mkdir ../Output/060

##################
# Execute cmdlet #
##################

Set-OpenXmlBackground -Path ../Input/060/060.docx -ColorName '4BACC6'

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/060.Ok

	# copy to outpufile
	copy ../Input/060/060.docx ../Output/060
}
else
{
	"process error" > ../Results/060.Nok
}