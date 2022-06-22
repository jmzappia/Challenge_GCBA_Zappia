##
##	Testcase 080
##	Set-OpenXmlFooter: Set valid footer to a file with no footers
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/080.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/080 ../Input
mkdir ../Output/080

##################
# Execute cmdlet #
##################

Set-OpenXmlFooter -Path ../Input/080/080.docx -FooterPath ../Input/080/footer1.xml -FooterType First -PassThru |
Set-OpenXmlFooter -FooterPath ../Input/080/footer2.xml -FooterType Even -PassThru |
Set-OpenXmlFooter -FooterPath ../Input/080/footer3.xml -FooterType Default

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/080.Ok

	# copy to outpufile
	copy ../Input/080/080.docx ../Output/080
}
else
{
	"process error" > ../Results/080.Nok
}