##
##	Testcase 091
##	Copy headers and footers from a document to a group of documents
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/091.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/091 ../Input
mkdir ../Output/091

##################
# Execute cmdlet #
##################

$firstHeader = Get-OpenXmlHeader -Path ../Input/091/091Get.docx -HeaderType First
$evenHeader = Get-OpenXmlHeader -Path ../Input/091/091Get.docx -HeaderType Even
$oddHeader = Get-OpenXmlHeader -Path ../Input/091/091Get.docx -HeaderType Default

$firstFooter = Get-OpenXmlFooter -Path ../Input/091/091Get.docx -FooterType First
$evenFooter = Get-OpenXmlFooter -Path ../Input/091/091Get.docx -FooterType Even
$oddFooter = Get-OpenXmlFooter -Path ../Input/091/091Get.docx -FooterType Default

Set-OpenXmlHeader  -Path ../Input/091/091Set1.docx, ../Input/091/091Set2.docx,../Input/091/091Set3.docx -Header $firstHeader -HeaderType First -PassThru |
Set-OpenXmlHeader  -Header $evenHeader -HeaderType Even -PassThru |
Set-OpenXmlHeader  -Header $oddHeader -HeaderType Default -PassThru |
Set-OpenXmlFooter  -Footer $firstFooter -FooterType First -PassThru |
Set-OpenXmlFooter  -Footer $evenFooter -FooterType Even -PassThru |
Set-OpenXmlFooter  -Footer $oddFooter -FooterType Default

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/091.Ok

	# copy to outpufile
	copy ../Input/091/091set* ../Output/091
}
else
{
	"process error" > ../Results/091.Nok
}
