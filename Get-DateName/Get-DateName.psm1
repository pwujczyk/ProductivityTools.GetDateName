function Get-DateName 
{
	[cmdletbinding()]
	param ([string]$Prefix,[string]$Suffix)

	Write-Verbose "Prefix: '$Prefix'"
	Write-Verbose "Suffix: '$Suffix'"
	$dt = get-date -format yyyy.MM.dd.hh.mm.ss
	$result=$Prefix+$dt+$Suffix
	Write-Verbose "Result: $result"
	return $result

}