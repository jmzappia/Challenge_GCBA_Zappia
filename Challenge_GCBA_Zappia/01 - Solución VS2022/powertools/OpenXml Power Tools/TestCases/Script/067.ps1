##
##	Testcase 067
##	Set-OpenXmlContentFormat: Set valid format to a run with defined format

##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/067.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/067 ../Input
mkdir ../Output/067

##################
# Execute cmdlet #
##################

Set-OpenXmlContentFormat -Path ../Input/067/067.docx -Content '<w:b/><w:u w:val="single" />' -InsertionPoint /w:document/w:body/w:p/w:r[1]

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/067.Ok

	# copy to outpufile
	copy ../Input/067/067.docx ../Output/067
}
else
{
	"process error" > ../Results/067.Nok
}