
@echo off
setlocal enabledelayedexpansion

:: Python Installer Script
:: Author: Recep Karayigit
:: Version: 1.1

set PYTHON_VERSION=3.12.0
set PYTHON_INSTALLER=python-%PYTHON_VERSION%-amd64.exe
set PYTHON_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/%PYTHON_INSTALLER%

echo ==================================================
echo   Python Installer Script
echo   Version: %PYTHON_VERSION%
echo ==================================================
echo.

:: Check if Python is already installed
echo Checking Python installation...
python --version >nul 2>nul

IF %ERRORLEVEL% EQU 0 (
    echo Python is already installed.
    python --version
    goto END
)

echo Python not found. Downloading installer...
echo.

:: Try curl first, fallback to PowerShell if not available
where curl >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    curl -o %PYTHON_INSTALLER% %PYTHON_URL%
) ELSE (
    powershell -Command "Invoke-WebRequest -Uri %PYTHON_URL% -OutFile '%PYTHON_INSTALLER%'"
)

IF NOT EXIST %PYTHON_INSTALLER% (
    echo Failed to download Python installer.
    goto END
)

echo Installing Python silently...
%PYTHON_INSTALLER% /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

echo Waiting for installation to complete...
timeout /t 25 >nul

echo Cleaning up installer...
del %PYTHON_INSTALLER%

:: Verify installation
echo.
python --version >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    echo Python installed successfully!
    python --version
) ELSE (
    echo Installation may have failed. Please check manually.
)

:END
echo.
pause
