##
##	Testcase 071
##	Set-OpenXmlContentStyle: Set valid content style to a paragraph with a defined style
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/071.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/071 ../Input
mkdir ../Output/071

##################
# Execute cmdlet #
##################

Set-OpenXmlContentStyle -Path ../Input/071/071.docx -InsertionPoint '/w:document/w:body/w:p[1]' -StyleName 'Title' -StylesSourcePath ../Input/071/styles.xml

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/071.Ok

	# copy to outpufile
	copy ../Input/071/071.docx ../Output/071
}
else
{
	"process error" > ../Results/071.Nok
}