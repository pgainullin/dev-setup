
# Installation #

1. Install [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/windows-powershell/install/installing-windows-powershell?view=powershell-7.1)

2. Set Execution Policy to allow running scripts:

```
set-executionpolicy remotesigned
```

3. Download the relevant .ps1 script to the new machine (or just copy the code and save in Notepad). 

# Usage #

1. Run PowerShell as Administrator.

2. cd to the directory you downloaded the script to and run it in PowerShell.

```
flutter-setup.ps1
flutter doctor --android-licenses
```

3. Launch Android Studio and Enable the flutter and Dart plugins. Restart Android Studio.

4. Add credentials: generate a GitHub Personal Access Token from Settings -> Developer Settings and use it to login to GitHub from Android Studio.


## Known issues: ##

- Some Android Licences do not get accepted automatically.
- SDK platforms not installed properly - fixed by Android Studio first start.
- Android Studio does not install completely (needs first start in UI). 


# Sources/Inspirations #

https://dev.to/dmehro/automate-development-environment-setup-via-powershell-20pf
https://stackoverflow.com/questions/54446759/how-to-launch-a-portable-install-of-android-studio-directly-bypassing-the-setup
https://stackoverflow.com/questions/38096225/automatically-accept-all-sdk-licences
