#takes all files from the $InputPath and moves them to the parent directory

param(
[string]$InputPath
)
$srcDir=(Get-Item -LiteralPath $InputPath)
$parentDir=$srcDir.Parent.FullName
$shell = New-Object -ComObject 'Shell.Application'    

$srcItems = $shell.NameSpace($InputPath)
$dstShellFolder = $shell.NameSpace($parentDir)
#Write-Host "$srcItems.Items()"
$dstShellFolder.MoveHere($srcItems.Items())

if ((Get-ChildItem -force $InputPath | Measure-Object).count -ne 0) 
{
	Write-Host "directory still contains files"
	pause
}
else 
{
	Remove-Item  -LiteralPath $srcDir -Recurse -Force
}