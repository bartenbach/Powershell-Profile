Write-Host "Updating profile..."
cp $profile $HOME\Documents\code\Powershell-Profile\
Write-Host "Updating vimrc..."
cp "C:\Program Files (x86)\Vim\_vimrc" $HOME\Documents\code\Powershell-Profile\

Write-Host -ForegroundColor "Green" "Done!"
