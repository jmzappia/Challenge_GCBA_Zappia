##
##	Testcase 012
##	Add-OpenXmlDigitalSignature: Resign a document with a previously used digital certificate
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/012.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/012 ../Input | Out-Null
mkdir ../Output/012 | Out-Null

##################
# Execute cmdlet #
##################

Add-OpenXmlDigitalSignature -Path ../Input/012/012.docx -Certificate ../Input/012/012.pfx 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Package is not a valid OpenXml document'" -ForegroundColor Yellow
###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/012.Ok

	# copy to outpufile
	copy ../Input/012/012.docx ../Output/012
}
else
{
	"process error" > ../Results/012.Nok
}