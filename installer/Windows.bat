@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
	set "DEL=%%a"
)
call :ColorText 0e "Administrative permissions required. Detecting permissions..."
echo.

net session >nul 2>&1
if %errorLevel% == 0 (
	call :ColorText 02 "Success. Administrative permissions confirmed"
	echo.
	echo Starting installation of Lighter, please wait...
	echo.
	echo Downloading latest realase...
	echo.

	mkdir C:\Temp\LighterInstall
	powershell Invoke-WebRequest http://server062122.nazwa.pl/Lighter/releases/latest.ZIP -OutFile C:\Temp\LighterInstall\realase.zip
	powershell Invoke-WebRequest http://server062122.nazwa.pl/Lighter/releases/latest.bat -OutFile C:\Temp\LighterInstall\realase.bat

	echo.
	call :ColorText 02 "Downloaded"
	echo.
	call :ColorText 03 "Unpacking files..."
	echo.

	mkdir C:\Windows\System32\Lighter
	powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('C:\Windows\System32\Lighter'); $zip = $shell.NameSpace('C:\Temp\LighterInstall\realase.zip'); $target.CopyHere($zip.Items(), 16); }"
	move C:\Temp\LighterInstall\realase.bat C:\Windows\System32\lighter.bat
	
	echo.
	call :ColorText 02 "Done"
	echo.
	echo.
	echo.
	echo Installation is done!
	echo Check if everything is working using "lighter test"
	echo Thank you for using Lighter!
	echo.
	echo Press any key to exit
	pause >nul
	goto :eof
) else (
	call :ColorText 0c "Failure. Please run install file as administrator!"
	echo.
	echo Press any key to exit
	pause >nul
	goto :eof
)

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof
