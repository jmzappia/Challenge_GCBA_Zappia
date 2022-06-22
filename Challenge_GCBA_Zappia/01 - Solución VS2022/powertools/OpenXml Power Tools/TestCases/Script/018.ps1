##
##	Testcase 018
##	Export-OpenXmlSpreadsheet: Export tabular output to a file with pie chart
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/018.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/018 ../Input
mkdir ../Output/018

##################
# Execute cmdlet #
##################

$sumPM = 0
Get-Process | 
Foreach-Object {$sumPM += $_.PM}

Get-Process | 
Sort-Object -Property PM,CPU -Descending |
Select-Object -Property Name,CPU,VM,PM,@{Name="PercPM";Expression={100 * $_.PM / $sumPM}},TotalProcessorTime -First 10 |
Sort-Object -Property Name |
Export-OpenXmlSpreadsheet -Chart -ChartType Pie -ColumnsToChart CPU,PercPM -HeaderColumn Name -OutputPath ../Output/018/018.xlsx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/018.Ok
}
else
{
	"process error" > ../Results/018.Nok
}