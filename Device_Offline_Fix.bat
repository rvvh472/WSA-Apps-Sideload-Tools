@echo off
if not exist "%~dp0adb.exe" ( echo adb file not found.:- error && pause)
"%~dp0adb.exe" kill-server
"%~dp0adb.exe" start-server
"%~dp0adb.exe" connect 127.0.0.1:58526