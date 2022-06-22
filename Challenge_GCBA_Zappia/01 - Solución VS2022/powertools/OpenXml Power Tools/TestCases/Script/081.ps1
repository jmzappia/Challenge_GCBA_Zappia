##
##	Testcase 081
##	Set-OpenXmlFooter: Set valid footer to a file with footers
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/081.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/081 ../Input
mkdir ../Output/081

##################
# Execute cmdlet #
##################

Set-OpenXmlFooter -Path ../Input/081/081.docx -FooterPath ../Input/081/footer1.xml -FooterType First
Set-OpenXmlFooter -Path ../Input/081/081.docx -FooterPath ../Input/081/footer2.xml -FooterType Even
Set-OpenXmlFooter -Path ../Input/081/081.docx -FooterPath ../Input/081/footer3.xml -FooterType Default

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/081.Ok

	# copy to outpufile
	copy ../Input/081/081.docx ../Output/081
}
else
{
	"process error" > ../Results/081.Nok
}