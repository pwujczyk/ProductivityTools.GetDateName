function GetFormat()
{
	return "yyyy.MM.dd.hh.mm.ss"
}
function Get-DateName 
{
	[cmdletbinding()]
	param ([string]$Prefix,[string]$Suffix)

	Write-Verbose "Prefix: '$Prefix'"
	Write-Verbose "Suffix: '$Suffix'"
	$dt = get-date -format $(GetFormat)
	$result=$Prefix+$dt+$Suffix
	Write-Verbose "Result: $result"
	return $result
}

function Get-LastDateDirectoryName
{
	[cmdletbinding()]
	param ([string]$Directory,[string]$Prefix,[string]$Suffix)
	
	Write-Verbose "Directory $Directory"
	Write-Verbose "Prefix: '$Prefix'"
	Write-Verbose "Suffix: '$Suffix'"

	$items = Get-ChildItem -Path $Directory -Filter "$Prefix*$Suffix"
	foreach($item in $items)
	{
		[datetime]::ParseExact($item.Name,$(GetFormat))
	}
}

Export-ModuleMember Get-DateName 
Export-ModuleMember Get-LastDateDirectoryName