cd /d "%~dp0"
:BIOSSTART
@echo off
cls
title Preparing...
color 06
echo Preparing...
@echo off
cls
setlocal EnableDelayedExpansion
:BIOS1
@echo off
cls
color 06
echo #### BIOS #### v03
color 0A
goto TEOSSTART

:BIOS
@echo off
cls
color 06
echo #### BIOS #### v03
pause > nul
exit


:TEOSSTART
cls
set edition=ultimateE
echo entering TEOS-2...
timeout 1 /nobreak > nul
cls
goto reset


:reset
powershell $Host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(80, 30)
set "tmp=0"
title TEOS-2
cls
echo.
echo.
ECHO ######## ######  #####   ######
ECHO    ##    ##     ##   ## ##
ECHO    ##    #####  ##   ##  #####    SYSTEMS (C)
ECHO    ##    ##     ##   ##       ##
ECHO    ##    ######  #####   ######
ECHO          "Synergy, Simply"
echo.
echo  TEOS-2 Emulator - 50 Hz          ... OK
echo  Checking TEOS-2 memory 256/256B  ... OK
echo Simulating TEOS-2 8-bit I/O port  ... OK
echo.
echo Loading TEOS-2 Ultimate Enviroment v1.6.1-b...
echo.
echo Starting hi-res, tri-color graphical session...
echo.
echo.
echo.
echo.
echo.
echo.
echo.

timeout 1 > nul
pause

goto :start

:start
set memory=0
cls
echo Welcome to TEOS-2, %username%!
echo -----------------------------
echo 1. Shutdown
echo 2. Reboot
echo 3. Changelogs
echo 4. Display system information
echo 5. Clock
echo 6. text editor
echo 7. calculator
ECHO 8. random string generator
echo 9. countdown timer
echo 10. memorizer
echo -----------------------------
set "choice=0"
set /p choice=Enter your choice:

if %choice% == 1 goto exit
if %choice% == 2 goto reset
if %choice% == 3 goto changelogs
if %choice% == 4 goto sysinfo
if %choice% == 5 goto clock
if %choice% == 6 goto texteditor
if %choice% == 7 goto calc
if %choice% == 8 goto gen
if %choice% == 9 goto timer
if %choice% == 10 goto memorizer
goto start

:changelogs
title TEOS-2
cls
echo                          TEOS-2
echo                     ---CHANGELOGS---
echo.
echo Version 1.0-a:
echo.
echo Basic system functionalities such as clock, calculator, and text editor.
echo Ability to display system information.
echo.
echo Version 1.1.1-a:
echo.
echo Fixed minor bugs.
echo improved the stability and performance.
echo Improved user interface.
echo.
echo Version 1.2-a:
echo.
echo Added the ability to reboot the system.
echo Fixed minor bugs and improved performance.
echo.
echo Version 1.3-a:
echo.
echo Added added many new features.
echo Improved user interface.
echo Fixed minor bugs.
echo.
echo Version 1.4.1-b:
echo.
echo Added a new feature: "Changelogs" to display the history of updates.
echo Improved overall performance and stability.
echo Added the ability to add spaces in the text editor.
echo.
echo Version 1.5.1-b:
echo The program requires administrator priviliges from now on.
echo added a new feature: "Memorizer"
echo Improved stability across different Windows versions.
echo Removed changing the program's title feature, this might come back in the future.
echo.
echo Version 1.6-b:
echo The program now has different editions.
echo Including: Ultimate, Profesional and Home.
echo.
echo Version 1.6.1-b
echo TEOS-2 updated for the needs of GuiTrim.
echo This Edition now has extended support from GuiTrim.
echo Fixed the buffer size breaking during startup.
echo The program does not require administrator permissions from now on.
echo Current version: 1.6.1-b
echo Current edition: %edition%
pause
goto start

:clock
cls
echo.
echo Current date and time:
echo.
date /t & time /t
pause
goto start

:sysinfo
cls
echo.
echo System information:
echo.
systeminfo
pause
goto start

:texteditor
cls
echo Simple Text Editor
echo -------------------
echo 1. Create a new file
echo 2. Edit an existing file
echo 3. View a file
echo 4. Delete a file
echo 5. Exit
echo -------------------
echo Spaces are now supported.
echo -------------------
set "choice=0"
set /p choice=Enter your choice: 
if %choice% == 1 goto create
if %choice% == 2 goto edit
if %choice% == 3 goto view
if %choice% == 4 goto delete
if %choice% == 5 goto exittexteditor
goto texteditor

:create
cls
set /p filename=Enter the name of the file to create:
echo. > "%filename%.txt"
echo File "%filename%.txt" created.
pause
goto texteditor

:edit
cls
set /p filename=Enter the name of the file to edit:
if not exist "%filename%.txt" (
  echo Error: File not found.
  pause
  goto texteditor
)

setlocal enabledelayedexpansion
set /a linecount=0
for /f "delims=" %%i in (%filename%.txt) do (
  set /a linecount+=1
  echo %%i >> temp.txt
)
del %filename%.txt
rename temp.txt %filename%.txt

:editfile
cls
type "%filename%.txt"
echo -------------------
echo Editing "%filename%.txt"
echo Special characters/symbols are not supported.
echo -------------------
set /p line=Enter text (or exit to quit): 
if "%line%" == "exit" goto texteditor
echo %line% >> "%filename%.txt"
goto editfile

:view
cls
set /p filename=Enter the name of the file to view:
if not exist "%filename%.txt" (
  echo Error: File not found.
  pause
  goto texteditor
)
type "%filename%.txt"
pause
goto texteditor

:delete
cls
set /p filename=Enter the name of the file to delete:
if not exist "%filename%.txt" (
  echo Error: File not found.
  pause
  goto texteditor
)
del "%filename%.txt"
echo File "%filename%.txt" deleted.
pause
goto texteditor

:exittexteditor
cls
echo Exiting Text Editor...
timeout 1 /nobreak > nul
goto start



:calc
cls
set result=0
echo Calculator
echo ---------------

set /p first_number=Enter the first number:
set /p second_number=Enter the second number:
set /p operation=Enter the operation (+, -, *, /):
set /a result=0

if "%operation%"=="+" (
    set /a result=%first_number% + %second_number%
) else if "%operation%"=="-" (
    set /a result=%first_number% - %second_number%
) else if "%operation%"=="*" (
    set /a result=%first_number% * %second_number%
) else if "%operation%"=="/" (
    set /a result=%first_number% / %second_number%
) else (
    echo Invalid operator!
)

echo result: %result%
pause
goto start

:gen
cls
echo random string generator
echo ---------------
echo 1. exit
echo 2. generate
echo 3. generate without special characters
set /p choice=choice:
if %choice% == 1 goto start
if %choice% == 2 goto generate
if %choice% == 3 goto generate2
goto gen
:generate
cls
echo random string Generator
echo -----------------------
echo.
set /p length=Enter length of string:
setlocal enabledelayedexpansion
set chars=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890@#$%^&*()_+-=[]{}|;':",./?

set result=
for /L %%i in (1,1,%length%) do (
  set /a index=!random! %% 94
  for %%c in (!index!) do set char=!chars:~%%c,1!
  set result=!result!!char!
)

echo Generated string: %result%

pause
goto gen

:generate2
cls
echo random string Generator
echo -----------------------
echo.
set /p length=Enter length of string:
setlocal enabledelayedexpansion
set chars=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890

set result=
for /L %%i in (1,1,%length%) do (
  set /a index=!random! %% 94
  for %%c in (!index!) do set char=!chars:~%%c,1!
  set result=!result!!char!
)

echo Generated string: %result%

pause
goto gen

:timer
cls
echo Countdown Timer
echo ---------------
set /p time=Enter time in seconds:

for /l %%s in (%time%,-1,1) do (
    cls
    echo Countdown Timer
    echo ---------------
    echo Time remaining: %%s seconds
    timeout /t 1 /nobreak > nul
)

echo Countdown complete!
pause
goto start

@echo off

:memorizer
set filename=Values.txt
cls
echo ======== Memorizer ========
echo 1. Exit
echo 2. Add to Memory
echo 3. View Memory
echo 4. Save Memory to File
echo 5. Load Memory from File
echo 6. Delete Memory File
echo 7. Clear memory

set /p option=Choose an option:

if "%option%"=="1" (
    echo Exiting Memorizer...
    goto start
)

if "%option%"=="2" (
    set /p value=Enter a value to add to memory:
    set /a memory+=value
    echo Value added to memory.
    pause
    goto memorizer
)

if "%option%"=="3" (
    echo Memory value is %memory%.
    pause
    goto memorizer
)

if "%option%"=="4" (
    set filename=values.txt
    echo %memory% > %filename%
    echo Memory saved to %filename%.
    pause
    goto memorizer
)

if "%option%"=="5" (
    set filename=values.txt
    if exist %filename% (
        set /p memory=<%filename%
        echo Memory loaded from %filename%.
    ) else (
        echo File not found.
    )
    pause
    goto memorizer
)

if "%option%"=="6" (
    set filename=values.txt
    if exist %filename% (
        del %filename%
        echo File %filename% deleted.
    ) else (
        echo File not found.
    )
    pause
    goto memorizer
)

if "%option%"=="7" (
set memory=0
echo Memory cleared.
pause
goto memorizer
)

echo Invalid option.
pause
goto memorizer











:exit
cls
echo Exiting OS...
cls
color 06
echo it is now safe to close this window.
timeout 255 /nobreak > nul
exit
