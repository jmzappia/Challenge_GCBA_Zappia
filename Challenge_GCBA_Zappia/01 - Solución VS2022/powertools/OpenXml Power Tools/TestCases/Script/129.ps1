##
##	Testcase 129
##	Generate index for an empty document
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/129.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/129 ../Input 
mkdir ../Output/129

##################
# Execute cmdlet #
##################

Add-OpenXmlDocumentIndex -Path ../Input/129/129.docx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/129.Ok

	# copy to outpufile
	copy ../Input/129/129.docx ../Output/129
}
else
{
	"process error" > ../Results/129.Nok
}