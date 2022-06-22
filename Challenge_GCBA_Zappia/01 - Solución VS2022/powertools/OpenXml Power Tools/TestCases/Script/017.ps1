##
##	Testcase 017
##	Export-OpenXmlSpreadsheet: Export tabular output to a file with line chart 
##

###############################################
# Clean Input, Output and Results directories #
###############################################

#rm -Recurse ../Input/*
#rm -Recurse ../Output/*
#rm ../Results/017.*

####################################################
# Copy the source files in the input directory and #
# create output cmdlet directory                   #
####################################################

copy -recurse Sources/017 ../Input
mkdir ../Output/017

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
Export-OpenXmlSpreadsheet -Chart -ChartType Line -ColumnsToChart CPU,PercPM -HeaderColumn Name -OutputPath ../Output/017/017.xlsx

###########################################
# Create result file in Results directory #
###########################################

if($?)
{
	"process complete" > ../Results/017.Ok
}
else
{
	"process error" > ../Results/017.Nok
}