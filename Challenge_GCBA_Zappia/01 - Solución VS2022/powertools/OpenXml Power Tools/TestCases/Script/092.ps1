##
##	Testcase 092
##	Reject all changes from a document, digitally sign it and lock it
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/092.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/092 ../Input 
mkdir ../Output/092

##################
# Execute cmdlet #
##################

Accept-OpenXmlChange -Path ../Input/092/092.docx -PassThru | Lock-OpenXmlDocument -PassThru | Add-OpenXmlDigitalSignature -Certificate ../Input/092/092.pfx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/092.Ok

	# copy to outpufile
	copy ../Input/092/092.docx ../Output/092
}
else
{
	"process error" > ../Results/092.Nok
}