##
##	Testcase 064
##	Set-OpenXmlContentFormat: Set valid format to a paragraph with no defined format 
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/064.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/064 ../Input
mkdir ../Output/064

##################
# Execute cmdlet #
##################

Set-OpenXmlContentFormat -Path ../Input/064/064.docx -Content '<w:jc w:val="right" />' -InsertionPoint /w:document/w:body/w:p[1]

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/064.Ok

	# copy to outpufile
	copy ../Input/064/064.docx ../Output/064
}
else
{
	"process error" > ../Results/064.Nok
}