##
##	Testcase 103
##	Join plain documents
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/103.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/103 ../Input 
mkdir ../Output/103

##################
# Execute cmdlet #
##################

Join-OpenXmlDocument -Path ../Input/103/103join1.docx,../Input/103/103join2.docx,../Input/103/103join3.docx -OutputPath "../Input/103/103out.docx"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/103.Ok

	# copy to outpufile
	copy ../Input/103/103* ../Output/103
}
else
{
	"process error" > ../Results/103.Nok
}