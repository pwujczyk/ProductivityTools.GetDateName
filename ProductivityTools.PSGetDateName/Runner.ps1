Clear-Host
cd $PSScriptRoot
Import-Module .\ProductivityTools.PSGetDateName.psm1 -Force
Get-DateName  -verbose
Get-DateName -Suffix "s" -Prefix "p" -verbose
Write-Host "####"
$path=Get-DateName -Suffix "s" -Prefix "p" -verbose
$path="d:\Trash\"+$path
New-Item -ItemType Directory -Path $path
Get-LastDateDirectoryName "d:\Trash\" -Verbose -Prefix "p" -Suffix "s"