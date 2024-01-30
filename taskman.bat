@echo off
title TaskMan
setlocal

:menu
cls
echo --- TaskMan ---
echo 1. View Processes
echo 2. Terminate Process
echo 3. Exit
set /p choice=Enter your choice: 

if "%choice%"=="1" goto view_processes
if "%choice%"=="2" goto terminate_process
if "%choice%"=="3" exit

:view_processes
cls
echo --- Process List ---
tasklist
pause
goto menu

:terminate_process
cls
echo --- Terminate Process ---
set /p pid=Enter PID of process to terminate: 
taskkill /pid %pid% /f
pause
goto menu

