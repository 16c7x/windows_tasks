[CmdletBinding()]
Param(
	[String]$password
)
$password | Out-File -FilePath C:\Users\Administrator\file.txt