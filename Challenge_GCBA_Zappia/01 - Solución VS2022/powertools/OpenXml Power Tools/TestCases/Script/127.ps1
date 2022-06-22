##
##	Testcase 127
##	Generate TOA for a document with no authorities
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/127.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/127 ../Input 
mkdir ../Output/127

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentTOA -Path ../Input/127/127.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/127.Ok

	# copy to outpufile
	copy ../Input/127/127.docx ../Output/127
}
else
{
	"process error" > ../Results/127.Nok
}