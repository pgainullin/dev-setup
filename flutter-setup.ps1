[String] $customPath = $args[0]

Write-Host  "Windows Development Machine Set-up Script for Android/Flutter" 

#Execution Policy check
$outStr = (get-ExecutionPolicy) | Out-String
Write-Host -NoNewline "Checking Execution Policy... "
Write-Host $outStr


#if($null -eq $customPath){
#    Write-Warning  "Using system default path" 
#} else {
#    Write-Warning  "Using custom path ${customPath} (UNIMPLEMENTED)" 
#}
 
#function to update system path after installation 
function Update-Environment-Path
{
    Write-Information "Path before = $env:Path"
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    Write-Information "Path after = $env:Path"
}
 
Set-ExecutionPolicy Bypass -Scope Process -Force;
#$ifChocoInstalled = powershell choco -v
 
 
#Choco installation
#if(-not($ifChocoInstalled)){
#    Write-host "Chocolatey is not installed, installing now " 
    Write-host "Installing Chocolatey"
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1') )
 
    Update-Environment-Path
 
#} else{
#    Write-host "Chocolatey $ifChocoInstalled is already installed" 
#}
 


#GIT Installation
 
#$ifGITInstalled = powershell git --version
 
 
#if(-not($ifGITInstalled)){
#    Write-host "GIT is not installed, installing now " 
    Write-host "Installing Git for Windows"
    echo A | choco install git --yes
  #  choco install gitextensions
     
    Update-Environment-Path
 
#} else {
#    Write-host "$ifGITInstalled is already installed" 
#}
 

#7-zip 
Write-host "Installing 7-Zip command line tool"
echo A | choco install 7zip.portable
Update-Environment-Path

#Notepad++ 
Write-host "Installing Notepad++"
echo A | choco install notepadplusplus.install
Update-Environment-Path
 
#Flutter, Chrome and Android Studio
Write-host "Installing Chrome, Flutter and Android Studio"
#echo A | choco install android-sdk
#Update-Environment-Path
echo A | choco install googlechrome
Update-Environment-Path
echo A | choco install flutter
Update-Environment-Path
echo A | choco install androidstudio
Update-Environment-Path

#ADB
Write-host "Installing ADB"
echo A | choco install adb

#VSCode
Write-host "Installing VSCode"
echo A | choco install vscode

#Accept Android SDK Licences
Write-host "Accepting Android Licences"
#Convert $dir to its short name equivalent
$dir=(New-Object -com scripting.filesystemobject).getFolder("$env:ANDROID_SDK_ROOT\tools\bin").ShortPath
Invoke-Expression("echo y | $dir\sdkmanager.bat --install 'platform-tools'")
Invoke-Expression("echo y | $dir\sdkmanager.bat --install 'platforms;android-28'")
Invoke-Expression("echo y | $dir\sdkmanager.bat --install 'platforms;android-29'")
Invoke-Expression("echo y | $dir\sdkmanager.bat --install 'platforms;android-30'")
Update-Environment-Path
Invoke-Expression("echo y | $dir\sdkmanager.bat --licenses")
# Invoke-Expression("$dir\sdkmanager.bat --licenses")
Update-Environment-Path

#setup Flutter
Write-host "Setting up Flutter"
flutter channel beta
flutter upgrade
flutter config --enable-web
Update-Environment-Path

#check that Flutter install is valid
flutter doctor

 
Write-Host "Script execution finished , please check output for any error and restart your machine." #-ForegroundColor blue  -BackgroundColor Yellow
