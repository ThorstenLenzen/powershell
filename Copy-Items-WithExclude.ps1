#=========================================================================
# Copy-Items-WithExclude (by Toto)
#
# Copies all the items of a given source folder structure recursively to 
# a target folder structure, but it does not copy the items, which are 
# matched by the exclude pattern.
#
# $Source: The source folder.
# $Target: The target folder.
# $ExcludePattern: The regular expression pattern. Matches are excluded.
#
# Example for $ExcludePattern -> \\obj|\\bin|\\ui|\\#|\\Deployment|\\TestResults
#
# Example for script invokation -> .\Copy-Items-WithExclude.ps1 -Source C:\WS\root\root\Prosim\PlanIT -Target C:\Temp\PlanIT
#=========================================================================

param(
[parameter(Mandatory=$true)][string]$Source,
[parameter(Mandatory=$true)][string]$Target,
[string]$ExcludePattern = "\\obj|\\bin|\\ui|\\#|\\Deployment|\\TestResults")

Get-ChildItem -Path $Source -Recurse | 
Where-Object { $_.FullName -notmatch $ExcludePattern } |
Copy-Item -Destination {
  if ($_.PSIsContainer) {
   Join-Path $Target $_.Parent.FullName.Substring($Source.length)
  } else {
   Join-Path $Target $_.FullName.Substring($Source.length)
  }
 } -Force
 