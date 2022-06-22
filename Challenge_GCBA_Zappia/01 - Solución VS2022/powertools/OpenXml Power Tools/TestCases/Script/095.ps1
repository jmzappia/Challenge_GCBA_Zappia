##
##	Testcase 095
##	Copy background Color information from a document to a group of documents
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/095.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/095 ../Input 
mkdir ../Output/095

##################
# Execute cmdlet #
##################

Get-OpenXmlBackground -Path ../Input/095/095Get.docx -Color | Set-OpenXmlBackground -Path ../Input/095/095Set-1.docx,../Input/095/095Set-2.docx,../Input/095/095Set-3.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/095.Ok

	# copy to outpufile
	copy ../Input/095/095Set* ../Output/095
}
else
{
	"process error" > ../Results/095.Nok
}