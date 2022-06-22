##
##	Testcase 088
##	Load an OpenXml document, apply a custom header and digitally sign it
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/088.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/088 ../Input
mkdir ../Output/088

##################
# Execute cmdlet #
##################

Get-OpenXmlDocument -Path ../Input/088/088.docx | 
Set-OpenXmlHeader -HeaderPath ../Input/088/header1.xml -HeaderType First -PassThru |
Set-OpenXmlHeader -HeaderPath ../Input/088/header2.xml -HeaderType Even -PassThru |
Set-OpenXmlHeader -HeaderPath ../Input/088/header3.xml -HeaderType Default -PassThru |
Add-OpenXmlDigitalSignature -Certificate ../Input/088/088.pfx
$result = $?


###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/088.Ok

	# copy to outpufile
	copy ../Input/088/088.docx ../Output/088
}
else
{
	"process error" > ../Results/088.Nok
}