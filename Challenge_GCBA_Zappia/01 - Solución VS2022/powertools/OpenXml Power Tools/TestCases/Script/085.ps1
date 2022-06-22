##
##	Testcase 085
##	Set-OpenXmlStyle: Set valid style to a file with no defined style
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/085.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/085 ../Input
mkdir ../Output/085

##################
# Execute cmdlet #
##################

Set-OpenXmlStyle -Path ../Input/085/085.docx -StylePath ../Input/085/styles.xml

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/085.Ok

	# copy to outpufile
	copy ../Input/085/085.docx ../Output/085
}
else
{
	"process error" > ../Results/085.Nok
}