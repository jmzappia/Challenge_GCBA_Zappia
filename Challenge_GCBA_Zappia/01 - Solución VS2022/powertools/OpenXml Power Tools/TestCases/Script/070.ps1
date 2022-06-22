##
##	Testcase 070
##	Set-OpenXmlContentStyle: Set valid content style to a paragraph with no defined style
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/070.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/070 ../Input
mkdir ../Output/070

##################
# Execute cmdlet #
##################

Set-OpenXmlContentStyle -Path ../Input/070/070.docx -InsertionPoint '/w:document/w:body/w:p[1]' -StyleName 'Title' -StylesSourcePath ../Input/070/styles.xml

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/070.Ok

	# copy to outpufile
	copy ../Input/070/070.docx ../Output/070
}
else
{
	"process error" > ../Results/070.Nok
}