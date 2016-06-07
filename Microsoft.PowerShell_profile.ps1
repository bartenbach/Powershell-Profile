# Powershell Profile
#   Blake Bartenbach


# PSDrives
New-PSDrive -Name startup -psprovider FileSystem -Root "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"  >> $null
New-PSDrive -Name code -psprovider FileSystem -Root "$HOME\Documents\code"                                                    >> $null

# Aliases
New-Alias -Name npp -Value "C:\Program Files (x86)\Notepad++\notepad++.exe" >> $null