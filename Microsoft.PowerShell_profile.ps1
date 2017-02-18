# Microsoft.PowerShell_profile.ps1
# Blake Bartenbach

# Modules
Import-Module PSColor

# PSDrives
New-PSDrive -Name Code      -PSProvider FileSystem -Root C:\Users\alureon\Documents\code >> $null
New-PSDrive -Name plugins   -PSProvider FileSystem -Root C:\Users\alureon\minecraft\plugins >> $null
New-PSDrive -Name minecraft -PSProvider FileSystem -Root C:\Users\alureon\minecraft >> $null
New-PSDrive -Name idea      -PSProvider FileSystem -Root C:\Users\alureon\IdeaProjects >> $null
New-PSDrive -Name Startup   -PSProvider FileSystem -Root "C:\Users\alureon\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" >> $null

# Aliases
New-Alias -Name npp            -Value 'C:\Program Files (x86)\Notepad++\notepad++.exe' >> $null
New-Alias -Name scrot          -Value 'snippingtool'
New-Alias -Name gradle         -Value 'C:\Users\alureon\Downloads\gradle-3.0-bin\gradle-3.0\bin\gradle.bat'
New-Alias -Name pc-information -Value 'C:\Users\alureon\Documents\code\PC-Information\PC-Information.ps1'

# Set error background color to current background color
$host.PrivateData.ErrorBackgroundColor = $host.UI.RawUI.BackgroundColor

# Prompt
function Prompt {
  Write-Host "[" -ForegroundColor "Green" -NoNewLine
  Write-Host $env:username -ForegroundColor "Green" -NoNewLine
  Write-Host "@" -ForegroundColor "Green" -NoNewLine
  Write-Host $env:computername -ForegroundColor "Green" -NoNewLine
  Write-Host "] " -ForegroundColor "Green" -NoNewLine
  Write-Host (pwd | select-object Path -expandproperty path) -ForegroundColor "Green" -NoNewLine
  Write-Host " % " -ForegroundColor "Green" -NoNewLine
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
