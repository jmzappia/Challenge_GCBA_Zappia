##
##	Testcase 013
##	Export-OpenXmlSpreadsheet: Export tabular output to a file
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/013.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/013 ../Input
mkdir ../Output/013

##################
# Execute cmdlet #
##################

Get-Process | Export-OpenXmlSpreadsheet -OutputPath ../Output/013/013.xlsx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/013.Ok
}
else
{
	"process error" > ../Results/013.Nok
}