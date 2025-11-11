@echo off
REM ===================================================================
REM LUXURY FASHION - AUTO SETUP & RUN SCRIPT (Windows)
REM Script tu dong cai dat va chay ca Backend + Frontend
REM ===================================================================

echo ================================================================
echo    LUXURY FASHION - AUTO SETUP ^& RUN
echo    Dang tu dong cai dat va chay Backend + Frontend...
echo ================================================================
echo.

REM Lay duong dan thu muc hien tai
set SCRIPT_DIR=%~dp0
set BACKEND_DIR=%SCRIPT_DIR%backend
set FRONTEND_DIR=%SCRIPT_DIR%frontend

REM ===================================================================
REM BUOC 1: KIEM TRA CAI DAT JAVA & NODE
REM ===================================================================
echo [Buoc 1] Kiem tra yeu cau he thong...
echo.

REM Kiem tra Java
where java >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] JAVA CHUA CAI DAT!
    echo Vui long cai dat Java 17 tai: https://www.oracle.com/java/technologies/downloads/
    pause
    exit /b 1
)
echo [OK] Java da cai dat

REM Kiem tra Maven
where mvn >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] MAVEN CHUA CAI DAT!
    echo Vui long cai dat Maven tai: https://maven.apache.org/download.cgi
    pause
    exit /b 1
)
echo [OK] Maven da cai dat

REM Kiem tra Node.js
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] NODE.JS CHUA CAI DAT!
    echo Vui long cai dat Node.js tai: https://nodejs.org/
    pause
    exit /b 1
)
echo [OK] Node.js da cai dat

REM Kiem tra npm
where npm >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] NPM CHUA CAI DAT!
    pause
    exit /b 1
)
echo [OK] npm da cai dat

echo.
echo [OK] Tat ca yeu cau he thong da duoc dam bao!
echo.

REM ===================================================================
REM BUOC 2: CAI DAT BACKEND
REM ===================================================================
echo ================================================================
echo    BUOC 2: CAI DAT BACKEND (Spring Boot + Maven)
echo ================================================================
echo.

cd /d "%BACKEND_DIR%"

echo Dang cai dat dependencies cho Backend...
call mvn clean install -DskipTests

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Loi khi cai dat Backend!
    echo Vui long kiem tra file pom.xml hoac ket noi internet
    pause
    exit /b 1
)

echo [OK] Backend dependencies da duoc cai dat thanh cong!
echo.

REM ===================================================================
REM BUOC 3: CAI DAT FRONTEND
REM ===================================================================
echo ================================================================
echo    BUOC 3: CAI DAT FRONTEND (Vue 3 + npm)
echo ================================================================
echo.

cd /d "%FRONTEND_DIR%"

echo Dang cai dat dependencies cho Frontend...
call npm install

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Loi khi cai dat Frontend!
    echo Vui long kiem tra file package.json hoac ket noi internet
    pause
    exit /b 1
)

echo [OK] Frontend dependencies da duoc cai dat thanh cong!
echo.

REM ===================================================================
REM BUOC 4: CHAY BACKEND & FRONTEND
REM ===================================================================
echo ================================================================
echo    BUOC 4: CHAY BACKEND + FRONTEND
echo ================================================================
echo.

REM Tao log directory
if not exist "%SCRIPT_DIR%logs" mkdir "%SCRIPT_DIR%logs"

REM Chay Backend trong background
echo Dang khoi dong Backend...
cd /d "%BACKEND_DIR%"
start "Luxury Fashion Backend" cmd /c "mvn spring-boot:run > ..\logs\backend.log 2>&1"

echo.
echo Doi Backend khoi dong (15 giay)...
timeout /t 15 /nobreak >nul

echo [OK] Backend dang chay tai: http://localhost:8080/api
echo.

REM Chay Frontend trong background
echo Dang khoi dong Frontend...
cd /d "%FRONTEND_DIR%"
start "Luxury Fashion Frontend" cmd /c "npm run dev > ..\logs\frontend.log 2>&1"

echo.
echo Doi Frontend khoi dong (5 giay)...
timeout /t 5 /nobreak >nul

echo [OK] Frontend dang chay tai: http://localhost:5173
echo.

echo ================================================================
echo    THANH CONG! CA 2 SERVICE DANG CHAY
echo ================================================================
echo.
echo Backend API:  http://localhost:8080/api
echo Frontend Web: http://localhost:5173
echo.
echo Log files:
echo    - Backend:  logs\backend.log
echo    - Frontend: logs\frontend.log
echo.
echo De dung ca 2 service, chay file: stop.bat
echo.
echo Nhan phim bat ky de mo browser...
pause >nul

REM Mo browser
start http://localhost:5173

echo.
echo Cac cua so Backend va Frontend dang chay o cac tab rieng
echo Dong cac cua so do de dung service!

