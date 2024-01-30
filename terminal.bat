@echo off
:start
powershell $Host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(65, 20)
rem This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/3.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.


title TEOS-2 Terminal
color 0E

echo Preparing...

cd /d "%~dp0"
cls

echo TEOS Systems (TM)
echo TEOS Terminal v3
echo.
:main
set command=0
set cmd=0
set /p command=%cd%^>
if /i "%command%"=="dir" goto dir_command
if /i "%command%"=="type" goto type_command
if /i "%command%"=="copy" goto copy_command
if /i "%command%"=="rename" goto rename_command
if /i "%command%"=="md" goto md_command
if /i "%command%"=="rd" goto rd_command
if /i "%command%"=="print" goto print_command
if /i "%command%"=="color" goto color_command
if /i "%command%"=="time" goto time_command
if /i "%command%"=="date" goto date_command
if /i "%command%"=="ping" goto ping_command
if /i "%command%"=="set" goto set_command
if /i "%command%"=="call" goto call_command
if /i "%command%"=="xcopy" goto xcopy_command
if /i "%command%"=="find" goto find_command
if /i "%command%"=="help" goto help_command
if /i "%command%"=="?" goto help_command
if /i "%command%"=="exit" goto exit_command
if /i "%command%"=="cmd" goto cmd
if /i "%command%"=="mediaplr" goto mediaplr
if /i "%command%"=="in" goto in_command
if /i "%command%"=="clear" goto clear_command
if /i "%command%"=="reset" goto start
if /i "%command%"=="admin" goto admin
echo Invalid command.
echo type 'help' or '?' for the list of available commands.
goto main

:dir_command
dir
goto main

:type_command
set /p filename=Enter filename:
type %filename%
goto main

:copy_command
set /p source=Enter source file path:
set /p destination=Enter destination file path:
copy %source% %destination%
goto main

:rename_command
set /p oldname=Enter old file name:
set /p newname=Enter new file name:
ren %oldname% %newname%
goto main

:md_command
set /p dirname=Enter directory name:
md %dirname%
goto main

:rd_command
set /p dirname=Enter directory name:
rd %dirname%
goto main

:print_command
set /p message=Enter message:
echo %message%
goto main

:color_command
set /p color=Enter color:
color %color%
goto main

:time_command
time /t
goto main

:date_command
date /t
goto main

:ping_command
set /p address=Enter IP address or hostname:
ping %address%
goto main

:set_command
set /p var=Enter variable name:
set /p val=Enter variable value:
set %var%=%val%
goto main

:call_command
set /p batch=Enter batch file name:
call %batch%
goto main

:xcopy_command
set /p source=Enter source file path:
set /p destination=Enter destination file path:
xcopy %source% %destination%
goto main

:find_command
set /p search=Enter search string:
set /p file=Enter filename:
find "%search%" %file%
goto main

:help_command
echo Available commands:
echo dir - Lists the contents of the current directory
echo type - Displays the contents of a text file
echo copy - Copies a file from one location to another
echo rename - Renames a file
echo md - Creates a new directory
echo rd - Deletes a directory
echo print - Displays a message
echo color - Changes the console color
echo time - Displays the system time
echo date - Displays the system date
echo ping - Tests network connectivity to a host
echo set - Sets the value of an environment variable
echo call - Calls another batch file
echo xcopy - Copies files and folders, including subdirectories
echo find - Searches for a string
echo cmd - Use Windows cmd commands
echo mediaplr - Opens media player
echo in - Change directory
echo clear - Clears the screen
echo admin - Relaunches the program with administrator priviliges
echo exit - Exits the program
echo.
goto main


:cmd
set /p cmd=Enter the command to execute:
%cmd%
goto main

:mediaplr
start C:\"Program Files (x86)"\"Windows Media Player"\wmplayer.exe
goto main

:in_command
set /p newdir=Enter directory or path:

if exist "%newdir%" (
    cd /d "%newdir%"
) else (
    echo Directory does not exist.
)
goto main

:admin
REM Check if script is already running as admin
net session >nul 2>&1
if %errorLevel% == 0 (
    REM Script is already running as admin, continue with script execution
) else (
    REM Script is not running as admin, relaunch script with admin privileges
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0'" && exit
)
goto main

:clear_command
cls
goto main

:exit_command
exit