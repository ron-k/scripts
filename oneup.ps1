#takes all files from the $InputPath and moves them to the parent directory

param(
[string]$InputPath
)

$parentDir=(Get-Item $InputPath).Parent.FullName
$shell = New-Object -ComObject 'Shell.Application'    

$srcItems = $shell.NameSpace($InputPath)
$dstShellFolder = $shell.NameSpace($parentDir)
$dstShellFolder.MoveHere($srcItems.Items())
