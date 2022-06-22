##
##	Testcase 073
##	Set-OpenXmlContentStyle: Set valid content style to a run with a defined style
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/073.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/073 ../Input
mkdir ../Output/073

##################
# Execute cmdlet #
##################

Set-OpenXmlContentStyle -Path ../Input/073/073.docx -InsertionPoint '/w:document/w:body/w:p/w:r[1]' -StyleName 'Strong' -StylesSourcePath ../Input/073/styles.xml

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/073.Ok

	# copy to outpufile
	copy ../Input/073/073.docx ../Output/073
}
else
{
	"process error" > ../Results/073.Nok
}