##
##	Testcase 046
##	Use style retrieved to set style to a document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/046*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/046 ../Input
mkdir ../Output/046

##################
# Execute cmdlet #
##################

Get-OpenXmlStyle -Path ../Input/046/046Get.docx | Set-OpenXmlStyle -Path ../Input/046/046Set.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/046.Ok
	# copy to outpufile
	copy ../Input/046/046Set.docx ../Output/046
}
else
{
	"process error" > ../Results/046Get.Nok
}