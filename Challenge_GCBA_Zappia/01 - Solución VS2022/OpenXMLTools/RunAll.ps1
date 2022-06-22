param([string]$auto)
$names = Get-ChildItem ???.ps1 | select-object -Property Name
if ($auto -eq "")
{
	$auto = Read-Host -Prompt "Type 'auto' [enter] to run all tests automatically, or [enter] to run tests interactivelly"
}
foreach ($name in $names)
{    
	$cmd = ".\" + $name.Name
	invoke-expression $cmd
	if ($auto -ne "auto")
	{
		read-host -Prompt "Press enter"
	}
}