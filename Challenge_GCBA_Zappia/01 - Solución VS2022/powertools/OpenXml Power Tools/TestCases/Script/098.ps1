##
##	Testcase 098
##	Get theme from a document with a theme associated
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/098.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/098 ../Input 
mkdir ../Output/098

##################
# Execute cmdlet #
##################

Get-OpenXmlTheme -Path ../Input/098/098.docx -OutputPath "../Input/098/098.thmx"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/098.Ok

	# copy to outpufile
	copy ../Input/098/098.docx ../Output/098
}
else
{
	"process error" > ../Results/098.Nok
}