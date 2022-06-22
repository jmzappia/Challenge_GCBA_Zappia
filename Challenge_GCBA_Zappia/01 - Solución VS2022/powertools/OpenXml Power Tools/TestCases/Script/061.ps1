##
##	Testcase 061
##	Set-OpenXmlBackground: Set color background to document with color background
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/061.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/061 ../Input
mkdir ../Output/061

##################
# Execute cmdlet #
##################

Set-OpenXmlBackground -Path ../Input/061/061.docx -ColorName '4BACC6'

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/061.Ok

	# copy to outpufile
	copy ../Input/061/061.docx ../Output/061
}
else
{
	"process error" > ../Results/061.Nok
}