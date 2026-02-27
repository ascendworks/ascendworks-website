@echo off
title AscendWorks Local Server
cd /d "%~dp0"

echo.
echo  AscendWorks Local Server
echo  ========================

:: Try Node.js npx serve first
where npx >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo  Starting with Node.js...
    echo  Open: http://localhost:8080
    echo.
    start "" "http://localhost:8080"
    npx serve . -p 8080 -s
    goto :end
)

:: Try Python 3
where python >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo  Starting with Python 3...
    echo  Open: http://localhost:8080
    echo.
    start "" "http://localhost:8080"
    python -m http.server 8080
    goto :end
)

:: Try py launcher
where py >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo  Starting with Python (py launcher)...
    echo  Open: http://localhost:8080
    echo.
    start "" "http://localhost:8080"
    py -m http.server 8080
    goto :end
)

:: Try Python3 explicitly
where python3 >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo  Starting with Python3...
    echo  Open: http://localhost:8080
    echo.
    start "" "http://localhost:8080"
    python3 -m http.server 8080
    goto :end
)

:: Fallback: just open the HTML file directly
echo  No server found. Opening index.html directly in browser...
echo  Note: Some features may require a server. Install Node.js or Python for best results.
echo.
start "" "%~dp0index.html"

:end
pause
