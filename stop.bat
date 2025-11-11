@echo off
REM ===================================================================
REM LUXURY FASHION - STOP SCRIPT (Windows)
REM Script de dung Backend + Frontend
REM ===================================================================

echo ================================================================
echo    LUXURY FASHION - STOP SCRIPT
echo    Dang dung Backend + Frontend...
echo ================================================================
echo.

REM Dung Backend (Java process)
echo Dang dung Backend...
taskkill /F /FI "WindowTitle eq Luxury Fashion Backend*" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [OK] Backend da dung
) else (
    echo [WARNING] Khong tim thay Backend dang chay
)

echo.

REM Dung Frontend (Node process)
echo Dang dung Frontend...
taskkill /F /FI "WindowTitle eq Luxury Fashion Frontend*" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [OK] Frontend da dung
) else (
    echo [WARNING] Khong tim thay Frontend dang chay
)

echo.
echo [OK] Tat ca service da duoc dung!
echo.
pause

