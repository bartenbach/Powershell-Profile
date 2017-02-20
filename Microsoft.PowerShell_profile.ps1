# Microsoft.PowerShell_profile.ps1
# Blake Bartenbach
# vim: ft=ps1

# Variables pertaining to cd-
[System.Collections.Stack]$GLOBAL:dirstack = @()
$GLOBAL:oldPath = $null
$GLOBAL:addToStack = $true

# Modules
Import-Module PSColor

# PSDrives
New-PSDrive -Name code      -PSProvider FileSystem -Root $HOME\Documents\code >> $null
#New-PSDrive -Name idea      -PSProvider FileSystem -Root $HOME\IdeaProjects >> $null
New-PSDrive -Name Startup   -PSProvider FileSystem -Root "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" >> $null
New-PSDrive -Name vim       -PSProvider FileSystem -Root "C:\Program Files (x86)\Vim" >> $null

# Aliases
New-Alias -Name reboot         -Value "Restart-Computer"
New-Alias -Name less           -Value more
New-Alias -Name npp            -Value 'C:\Program Files (x86)\Notepad++\notepad++.exe' >> $null
New-Alias -Name scrot          -Value 'snippingtool'
New-Alias -Name gradle         -Value '$HOME\Downloads\gradle-3.0-bin\gradle-3.0\bin\gradle.bat'
New-Alias -Name pc-information -Value '$HOME\Documents\code\PC-Information\Get-PC-Information.ps1'

# Set error background color to current background color
$host.PrivateData.ErrorBackgroundColor = $host.UI.RawUI.BackgroundColor

# Prompt
function Prompt {
  # cd -
  $GLOBAL:currentPath = (Get-Location).Path
  if (($currentPath -ne $oldPath) -and $GLOBAL:addToStack) {
    $GLOBAL:dirstack.Push($oldPath)
    $GLOBAL:oldPath = $currentPath 
  }
  $GLOBAL:addToStack = $true
  
  # prompt format
  Write-Host "[" -ForegroundColor "Green" -NoNewLine
  Write-Host $env:username -ForegroundColor "Green" -NoNewLine
  Write-Host "@" -ForegroundColor "Green" -NoNewLine
  Write-Host $env:computername -ForegroundColor "Green" -NoNewLine
  Write-Host "] " -ForegroundColor "Green" -NoNewLine
  Write-Host (pwd | select-object Path -expandproperty path) -ForegroundColor "Green" -NoNewLine
  Write-Host " %" -ForegroundColor "Green" -NoNewLine
  return ' '
}

# Touch
function touch {
  $file = $args[0]
  if ($file -eq $null) {
    throw "No filename specified"
  }
  if (Test-Path $file) {
    (gci $file).LastWriteTime = Get-Date
  } else {
    New-Item -ItemType file $file
  }
}

# This is amazing.  It's really like grep.
function grep {
  $input | out-string -stream | select-string $args[0] | %{$_.Line.Split(":")}
}

# cd - (like linux)
function cd- {
  $lastPath = $GLOBAL:dirstack.Pop()
  $GLOBAL:addToStack = $false
  cd $lastPath
}
