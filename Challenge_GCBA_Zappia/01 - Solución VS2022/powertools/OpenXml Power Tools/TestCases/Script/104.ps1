##
##	Testcase 104
##	Join a plain document with itself
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/104.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/104 ../Input 
mkdir ../Output/104

##################
# Execute cmdlet #
##################

Join-OpenXmlDocument -Path ../Input/104/104.docx,../Input/104/104.docx -OutputPath "../Input/104/104out.docx"

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/104.Ok

	# copy to outpufile
	copy ../Input/104/104.docx ../Output/104
}
else
{
	"process error" > ../Results/104.Nok
}