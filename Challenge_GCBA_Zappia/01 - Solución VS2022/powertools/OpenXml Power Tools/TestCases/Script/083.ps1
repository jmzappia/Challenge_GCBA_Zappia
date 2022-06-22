##
##	Testcase 083
##	Set-OpenXmlHeader: Set valid header to a file with no headers
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/083.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/083 ../Input
mkdir ../Output/083

##################
# Execute cmdlet #
##################

Set-OpenXmlHeader -Path ../Input/083/083.docx -HeaderPath ../Input/083/header1.xml -HeaderType First
Set-OpenXmlHeader -Path ../Input/083/083.docx -HeaderPath ../Input/083/header2.xml -HeaderType Even
Set-OpenXmlHeader -Path ../Input/083/083.docx -HeaderPath ../Input/083/header3.xml -HeaderType Default

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/083.Ok

	# copy to outpufile
	copy ../Input/083/083.docx ../Output/083
}
else
{
	"process error" > ../Results/083.Nok
}