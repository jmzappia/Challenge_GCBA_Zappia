##
##	Testcase 082
##	Set-OpenXmlFooter: Set invalid footer to a file
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/082.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/082 ../Input
mkdir ../Output/082

##################
# Execute cmdlet #
##################

Set-OpenXmlFooter -Path ../Input/082/082.docx -FooterPath ../Input/082/footer1.xml -FooterType First 2>&1
$result = $?
Write-Host "This cmdlet execution is intented to fail as 'Data at the root level is invalid. Line 2, position 721.'" -ForegroundColor Yellow

###########################################
# Create result file in Results directory #
###########################################

if($result)
{
	"process complete" > ../Results/082.Ok

	# copy to outpufile
	copy ../Input/082/082.docx ../Output/082
}
else
{
	"process error" > ../Results/082.Nok
}