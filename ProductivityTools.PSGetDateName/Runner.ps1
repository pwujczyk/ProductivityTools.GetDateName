Clear-Host
cd $PSScriptRoot
Import-Module .\ProductivityTools.PSGetDateName.psm1 -Force
Get-DateName  -verbose
Get-DateName -Suffix "s" -Prefix "p" -verbose
Write-Host "####"
Get-LastDateDirectoryName "d:\Trash\xxx\" -Verbose