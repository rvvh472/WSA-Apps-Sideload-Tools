@echo off
if not exist "%~dp0adb.exe" ( echo adb file not found.:- error && pause)
"%~dp0adb.exe" connect 127.0.0.1:58526 
"%~dp0adb.exe" push %* ./storage/emulated/0/Download