##
##	Testcase 066
##	Set-OpenXmlContentFormat: Set valid format to a run with no defined format
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/066.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/066 ../Input
mkdir ../Output/066

##################
# Execute cmdlet #
##################

Set-OpenXmlContentFormat -Path ../Input/066/066.docx -Content '<w:b/><w:u w:val="single" />' -InsertionPoint /w:document/w:body/w:p/w:r[1]

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/066.Ok

	# copy to outpufile
	copy ../Input/066/066.docx ../Output/066
}
else
{
	"process error" > ../Results/066.Nok
}