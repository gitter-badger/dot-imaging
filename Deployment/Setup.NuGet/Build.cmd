﻿:: The script was taken from: Accord.NET project and modified
@echo off

echo.
echo DotImaging Framework NuGet packages builder
echo =========================================================
echo. 
echo This Windows batch file uses NuGet to automatically
echo build the NuGet packages versions of the framework.
echo. 

timeout /T 5

:: Set version info
set version=4.7.6
set output=%cd%\bin\

:: Create output directory
IF NOT EXIST %output%\nul (
    mkdir %output%
)

:: Remove old files
:forfiles /p %output% /m *.nupkg /c "cmd /c del @file"

echo.
echo Creating packages...

forfiles /s /m *.nuspec /c "cmd /c %cd%\nuget.exe pack "@Path" -Version %version% -OutputDirectory %output%"

:eof