@echo off
rem nt version
for /f "tokens=3" %%v in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentVersion ^| findstr /i "CurrentVersion"') do (
    set NT=%%v
)
set majorNT=%NT:~0,1%
set ver=1.5

rem check if powershell is installed
where /q powershell
cls
if %errorlevel% neq 0 (
    echo Warning: Powershell not available.
    echo You may encounter compatibility issues.
    set compatibility=True
)

REM Check if major version is less than 6 (indicating Windows Vista or earlier)
if %majorNT% lss 6 (
    echo Warning: Your NT version is below 6.x.
    echo You may encounter compatibility issues.
    set compatibility=True
)

REM Check if the system type is x86
if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    echo WARNING: You are running x86/32-bit legacy hardware.
    echo Some operations may not work optimally.
    set compatibility=True
)

if "%compatibility%"=="True" (
    echo 
    pause
)
pause