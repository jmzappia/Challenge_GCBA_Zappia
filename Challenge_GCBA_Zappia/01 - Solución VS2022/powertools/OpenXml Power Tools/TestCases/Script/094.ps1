##
##	Testcase 094
##	Generate a Spreadsheet document from Get-Process output, set the style from a predefined styles file, digitally sign it and Lock it
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/094.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/094 ../Input 
mkdir ../Output/094

##################
# Execute cmdlet #
##################

Get-Process | 
Export-OpenXmlSpreadsheet -Chart -ChartType Bar -ColumnsToChart CPU,PM -HeaderColumn Name -OutputPath ../Output/094/output.xlsx -PassThru |
Add-OpenXmlDigitalSignature -Certificate ../Input/094/094.pfx -PassThru |
Lock-OpenXmlDocument
##

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/094.Ok

	# copy to outpufile
	copy ../Input/094/094* ../Output/094
}
else
{
	"process error" > ../Results/094.Nok
}