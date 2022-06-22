##
##	Testcase 072
##	Set-OpenXmlContentStyle: Set valid content style to a run with no defined style
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/072.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/072 ../Input
mkdir ../Output/072

##################
# Execute cmdlet #
##################

Set-OpenXmlContentStyle -Path ../Input/072/072.docx -InsertionPoint '/w:document/w:body/w:p/w:r[1]' -StyleName 'Strong' -StylesSourcePath ../Input/072/styles.xml

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/072.Ok

	# copy to outpufile
	copy ../Input/072/072.docx ../Output/072
}
else
{
	"process error" > ../Results/072.Nok
}