##
##	Testcase 056
##	Set-OpenXmlBackground: Set picture background to document with no background
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/056.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/056 ../Input
mkdir ../Output/056

##################
# Execute cmdlet #
##################

Set-OpenXmlBackground -Path ../Input/056/056.docx -ImagePath ../Input/056/056.jpg

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/056.Ok

	# copy to outpufile
	copy ../Input/056/056.docx ../Output/056
}
else
{
	"process error" > ../Results/056.Nok
}