# Microsoft.PowerShell_profile.ps1
# Blake Bartenbach

# Modules
Import-Module PSColor

# PSDrives
New-PSDrive -Name Code -PSProvider FileSystem -Root C:\Users\alureon\Documents\code >> $null
New-PSDrive -Name Startup -PSProvider FileSystem -Root "C:\Users\alureon\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" >> $null

# Aliases
New-Alias -Name npp -Value 'C:\Program Files (x86)\Notepad++\notepad++.exe' >> $null
New-Alias -Name scrot -Value 'snippingtool'

# Prompt
function Prompt {
    Write-Host "[" -ForegroundColor "Green" -NoNewLine
    Write-Host $env:username -ForegroundColor "Green" -NoNewLine
    Write-Host "@" -ForegroundColor "Green" -NoNewLine
    Write-Host $env:computername -ForegroundColor "Green" -NoNewLine
    Write-Host "] " -ForegroundColor "Green" -NoNewLine
    Write-Host (shorten-path (pwd).Path) -ForegroundColor "Green" -NoNewLine
    Write-Host " % " -ForegroundColor "Green" -NoNewLine
    return ' '
}

function shorten-path([string] $path) {
   $loc = $path.Replace($HOME, '~')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''
   # make path shorter like tabs in Vim,
   # handle paths starting with \\ and . correctly
   return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2')
}