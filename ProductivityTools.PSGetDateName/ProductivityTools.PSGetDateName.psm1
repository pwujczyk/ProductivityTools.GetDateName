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

	$lastDate=[DateTime]::MinValue;
	$items = Get-ChildItem -Path $Directory -Filter "$Prefix*$Suffix"
	foreach($item in $items)
	{
		$directoryName=$item.Name;
		$directoryName=$directoryName.Replace($Prefix,"")
		$directoryName=$directoryName.Replace($Suffix,"")
		$format=GetFormat
		$directoryDate=[datetime]::ParseExact($directoryName,$format,$null)
		
		if ($directoryDate -gt $lastDate)
		{
			$lastDate=$directoryDate
		}
		return $lastDate
	}
}

Export-ModuleMember Get-DateName 
Export-ModuleMember Get-LastDateDirectoryName