##
##	Testcase 014
##	Export-OpenXmlSpreadsheet: Export non-tabular output to a file
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/014.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/014 ../Input
mkdir ../Output/014

##################
# Execute cmdlet #
##################

('One','Two','Three') | Export-OpenXmlSpreadsheet -OutputPath ../Output/014/014.xlsx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/014.Ok
}
else
{
	"process error" > ../Results/014.Nok
}