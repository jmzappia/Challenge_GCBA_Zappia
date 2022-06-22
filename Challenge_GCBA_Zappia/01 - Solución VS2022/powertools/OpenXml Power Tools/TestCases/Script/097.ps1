##
##	Testcase 097
##	Accept all changes of a document, apply style title 1 to first paragraph and normal style to all but first and export results to html by using a custom transformation
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/097.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/097 ../Input 
mkdir ../Output/097

##################
# Execute cmdlet #
##################

Accept-OpenXmlChange ../Input/097/097.docx -PassThru | 
Set-OpenXmlContentStyle -StyleName Strong -InsertionPoint '//w:p/w:r' -StylesSourcePath ../Input/097/styles.xml -PassThru |
Set-OpenXmlContentStyle -StyleName "Heading1" -InsertionPoint '//w:p[1]' -StylesSourcePath ../Input/097/styles.xml


###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/097.Ok

	# copy to outpufile
	copy ../Input/097/097.docx ../Output/097
}
else
{
	"process error" > ../Results/097.Nok
}