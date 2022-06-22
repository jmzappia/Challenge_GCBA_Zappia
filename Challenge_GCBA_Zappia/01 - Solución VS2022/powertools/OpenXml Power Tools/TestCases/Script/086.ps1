##
##	Testcase 086
##	Set-OpenXmlStyle: Set valid style to a file with style defined
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/086.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/086 ../Input
mkdir ../Output/086

##################
# Execute cmdlet #
##################

Set-OpenXmlStyle -Path ../Input/086/086.docx -StylePath ../Input/086/styles.xml

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/086.Ok

	# copy to outpufile
	copy ../Input/086/086.docx ../Output/086
}
else
{
	"process error" > ../Results/086.Nok
}