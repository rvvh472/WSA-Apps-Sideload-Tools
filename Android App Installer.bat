@echo off
setlocal enabledelayedexpansion
if not exist "%~dp0adb.exe" ( echo adb file not found.:- error && pause)
%~dp0adb.exe connect 127.0.0.1:58526 > nul
if not exist "%~dp0temp1" (mkdir %~dp0temp1)
set "temp1=%~dp0temp1\"
set "sources=%temp1%sources\"
set  "_Green="0A""
if not exist "C:\Program Files\7-Zip\" (echo 7zip is not detected. Kindly install it first. && pause )
for %%A in (%*) do (
if %%~xA==.apk (
echo "%%~nA%%~xA is being installed" 
"%~dp0adb.exe" install %%A > nul
echo "%%~nA%%~xA successfully installed" 
) else (
if %%~xA==.sapk (
"C:\Program Files\7-Zip\7z.exe" x %%A -o%temp1% -y > nul
set "z="
for %%B in (%sources%*.apk) do (set "z=!z!%%~fB ")
echo "%%~nA%%~xA is being installed" && %~dp0adb.exe install-multiple -r -g !z! > nul && echo "%%~nA%%~xA successfully installed" 
pushd %temp1%
rd /s /q . 2>nul
) else ( 
if %%~xA==.sapk (
"C:\Program Files\7-Zip\7z.exe" x %%A -o%temp1% -y > nul
set "z="
for %%B in (%temp1%*.apk) do (set "z=!z!%%~fB ")
echo "%%~nA%%~xA is being installed" && %~dp0adb.exe install-multiple -r -g !z! > nul && echo "%%~nA%%~xA successfully installed" 
     pushd %temp1%
     rd /s /q . 2>nul ) ) )
)
pause
EXIT /B