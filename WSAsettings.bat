@echo off
if not exist "%~dp0adb.exe" ( echo adb file not found.:- error && pause)
%~dp0adb.exe connect 127.0.0.1:58526 > nul
%~dp0adb.exe shell monkey -p com.android.settings -c android.intent.category.LAUNCHER 1 > nul
EXIT /B
