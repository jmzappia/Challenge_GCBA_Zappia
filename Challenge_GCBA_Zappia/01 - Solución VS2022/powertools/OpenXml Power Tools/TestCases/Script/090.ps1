##
##	Testcase 090
##	Copy styles from a document to a group of documents
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/090.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/090 ../Input
mkdir ../Output/090

##################
# Execute cmdlet #
##################

Get-OpenXmlStyle -Path ../Input/090/090Get.docx |
Set-OpenXmlStyle -Path ../Input/090/090Set1.docx,../Input/090/090Set2.docx,../Input/090/090Set3.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/090.Ok

	# copy to outpufile
	copy ../Input/090/090Set1.docx,../Input/090/090Set2.docx,../Input/090/090Set3.docx ../Output/090
}
else
{
	"process error" > ../Results/090.Nok
}