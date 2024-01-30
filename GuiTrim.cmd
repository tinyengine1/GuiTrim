@echo off
rem Check if running in fullscreen mode
if not "%1"=="fullscreen" (
    start /max cmd /c "%~f0" fullscreen
    exit
)

color 0b

:var

rem nt version
for /f "tokens=3" %%v in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentVersion ^| findstr /i "CurrentVersion"') do (
    set NT=%%v
)

set ver=1.4


:start
taskkill /f /im explorer.exe
echo.
cls
cd /d "%~dp0"

call powershell -c "(New-Object Media.SoundPlayer 'start.wav').PlaySync();"
title GuiTrim %ver%

:main
echo Welcome to GuiTrim! [Reporting NT %NT%]
echo.


cd /d "%~dp0"

echo --------------------------------------
echo 1. Start Command Prompt
echo 2. Start TaskMan
echo 3. Launch TEOS-2 enviroment
echo 4. Start TEOS-2 Terminal
echo 5. Windows version
echo 6. Launch Windows Media Player
echo 7. Beep
echo 8. Run command (cmd.exe)
echo 99. Options (WIP)
echo 0. Quit GuiTrim
echo --------------------------------------
set /p choice=">"
if %choice%==1 start cmd
if %choice%==2 start taskman.bat
if %choice%==3 start teos-2.bat
if %choice%==4 start terminal.bat
if %choice%==5 start winver 
if %choice%==6 start wmplayer
if %choice%==7 echo 
if %choice%==8 goto :runcmd
if %choice%==99 goto :options
if %choice%==0 goto :exit

:return
pause
cls
goto :main

:options
echo work in progress
goto :return

:runcmd
set /p cmd=">>>"
%cmd%
set cmd=""
goto :return



:exit
rem return explorer back
start explorer.exe
exit /b 0
