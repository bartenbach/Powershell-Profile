Write-Host "Updating profile..."
cp $profile C:\Users\alureon\Documents\code\Powershell-Profile\
Write-Host "Updating vimrc..."
cp "C:\Program Files (x86)\Vim\_vimrc" C:\Users\alureon\Documents\code\Powershell-Profile\

Write-Host -ForegroundColor "Green" "Done!"
