#!/bin/bash

# ===================================================================
# LUXURY FASHION - AUTO SETUP & RUN SCRIPT
# Script tu dong cai dat va chay ca Backend + Frontend
# ===================================================================

echo "╔══════════════════════════════════════════════════════════╗"
echo "║   LUXURY FASHION - AUTO SETUP & RUN                      ║"
echo "║   Dang tu dong cai dat va chay Backend + Frontend...     ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Lay duong dan thu muc hien tai
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKEND_DIR="$SCRIPT_DIR/backend"
FRONTEND_DIR="$SCRIPT_DIR/frontend"

# ===================================================================
# BUOC 1: KIEM TRA CAI DAT JAVA & NODE
# ===================================================================
echo "📋 Buoc 1: Kiem tra yeu cau he thong..."
echo ""

# Kiem tra Java
if command -v java &> /dev/null; then
    JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo "✅ Java da cai dat: $JAVA_VERSION"
else
    echo "❌ JAVA CHUA CAI DAT!"
    echo "   Vui long cai dat Java 17 tai: https://www.oracle.com/java/technologies/downloads/"
    exit 1
fi

# Kiem tra Maven
if command -v mvn &> /dev/null; then
    MVN_VERSION=$(mvn -version | head -n 1)
    echo "✅ Maven da cai dat: $MVN_VERSION"
else
    echo "❌ MAVEN CHUA CAI DAT!"
    echo "   Vui long cai dat Maven tai: https://maven.apache.org/download.cgi"
    exit 1
fi

# Kiem tra Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v)
    echo "✅ Node.js da cai dat: $NODE_VERSION"
else
    echo "❌ NODE.JS CHUA CAI DAT!"
    echo "   Vui long cai dat Node.js tai: https://nodejs.org/"
    exit 1
fi

# Kiem tra npm
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm -v)
    echo "✅ npm da cai dat: v$NPM_VERSION"
else
    echo "❌ NPM CHUA CAI DAT!"
    exit 1
fi

echo ""
echo "✅ Tat ca yeu cau he thong da duoc dam bao!"
echo ""

# ===================================================================
# BUOC 1.5: KILL PROCESS CU DANG DUNG PORT
# ===================================================================
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   KIEM TRA VA DUNG PROCESS CU                            ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Kill process dang dung port 8080 (Backend)
echo "🔍 Kiem tra port 8080 (Backend)..."
BACKEND_PID=$(lsof -ti:8080)
if [ ! -z "$BACKEND_PID" ]; then
    echo "⚠️  Port 8080 dang duoc su dung boi process PID: $BACKEND_PID"
    echo "🛑 Dang dung process cu..."
    kill -9 $BACKEND_PID 2>/dev/null
    sleep 1
    echo "✅ Da dung process Backend cu"
else
    echo "✅ Port 8080 trong"
fi

echo ""

# Kill process dang dung port 5173 (Frontend)
echo "🔍 Kiem tra port 5173 (Frontend)..."
FRONTEND_PID=$(lsof -ti:5173)
if [ ! -z "$FRONTEND_PID" ]; then
    echo "⚠️  Port 5173 dang duoc su dung boi process PID: $FRONTEND_PID"
    echo "🛑 Dang dung process cu..."
    kill -9 $FRONTEND_PID 2>/dev/null
    sleep 1
    echo "✅ Da dung process Frontend cu"
else
    echo "✅ Port 5173 trong"
fi

echo ""

# ===================================================================
# BUOC 2: CAI DAT BACKEND
# ===================================================================
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   BUOC 2: CAI DAT BACKEND (Spring Boot + Maven)          ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

cd "$BACKEND_DIR" || exit 1

echo "📦 Dang cai dat dependencies cho Backend..."
mvn clean install -DskipTests

if [ $? -eq 0 ]; then
    echo "✅ Backend dependencies da duoc cai dat thanh cong!"
else
    echo "❌ Loi khi cai dat Backend!"
    echo "   Vui long kiem tra file pom.xml hoac ket noi internet"
    exit 1
fi

echo ""

# ===================================================================
# BUOC 3: CAI DAT FRONTEND
# ===================================================================
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   BUOC 3: CAI DAT FRONTEND (Vue 3 + npm)                 ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

cd "$FRONTEND_DIR" || exit 1

echo "📦 Dang cai dat dependencies cho Frontend..."
npm install

if [ $? -eq 0 ]; then
    echo "✅ Frontend dependencies da duoc cai dat thanh cong!"
else
    echo "❌ Loi khi cai dat Frontend!"
    echo "   Vui long kiem tra file package.json hoac ket noi internet"
    exit 1
fi

echo ""

# ===================================================================
# BUOC 4: CHAY BACKEND & FRONTEND
# ===================================================================
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   BUOC 4: CHAY BACKEND + FRONTEND                        ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Tao log directory
mkdir -p "$SCRIPT_DIR/logs"

# Chay Backend trong background
echo "\ud83d\ude80 Dang khoi dong Backend..."
cd "$BACKEND_DIR" || exit 1
mvn spring-boot:run > "$SCRIPT_DIR/logs/backend.log" 2>&1 &
BACKEND_PID=$!
echo "   Backend PID: $BACKEND_PID"
echo "   Log file: logs/backend.log"

# Thay the doan cho doi 15 giay bang co che kiem tra linh hoat
echo ""
echo "\u23f3 Dang doi Backend khoi dong (toi da 40 giay)..."
BACKEND_READY=false
for i in $(seq 1 40); do
  # Vong lap thu $i de kiem tra trang thai backend
  if lsof -ti:8080 > /dev/null 2>&1; then
    # Kiem tra thong diep started trong log
    if grep -q "Started LuxuryFashionApplication" "$SCRIPT_DIR/logs/backend.log"; then
      BACKEND_READY=true
      break
    fi
  fi
  # Neu process goc chet nhung port chua mo, co the do devtools restart => tiep tuc cho
  sleep 1
done

if [ "$BACKEND_READY" = true ]; then
  echo "\u2705 Backend da khoi dong thanh cong tai: http://localhost:8080/api"
else
  echo "\u274c Backend khong khoi dong duoc trong thoi gian cho!"
  echo "   Kiem tra nhanh trang thai port 8080:"
  if lsof -ti:8080 > /dev/null 2>&1; then
    echo "   -> Port 8080 dang mo nhung khong thay thong diep Started (co the chuong trinh dang loi / dang restart)."
  else
    echo "   -> Port 8080 chua mo."
  fi
  echo "   20 dong cuoi log Backend:";
  tail -n 20 "$SCRIPT_DIR/logs/backend.log" | sed 's/^/      /'
  exit 1
fi

echo ""

# Chay Frontend trong background
echo "🚀 Dang khoi dong Frontend..."
cd "$FRONTEND_DIR" || exit 1
npm run dev > "$SCRIPT_DIR/logs/frontend.log" 2>&1 &
FRONTEND_PID=$!
echo "   Frontend PID: $FRONTEND_PID"
echo "   Log file: logs/frontend.log"

# Doi 5 giay de Frontend khoi dong
echo ""
echo "⏳ Doi Frontend khoi dong (5 giay)..."
sleep 5

# Kiem tra Frontend co chay khong
if ps -p $FRONTEND_PID > /dev/null; then
    echo "✅ Frontend dang chay tai: http://localhost:5173"
else
    echo "❌ Frontend khong khoi dong duoc!"
    echo "   Vui long kiem tra logs/frontend.log de xem chi tiet loi"
    exit 1
fi

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   🎉 THANH CONG! CA 2 SERVICE DANG CHAY                  ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
echo "📍 Backend API:  http://localhost:8080/api"
echo "📍 Frontend Web: http://localhost:5173"
echo ""
echo "📋 Log files:"
echo "   - Backend:  logs/backend.log"
echo "   - Frontend: logs/frontend.log"
echo ""
echo "🛑 De dung ca 2 service, chay lenh:"
echo "   ./stop.sh"
echo ""
echo "💡 Hoac nhan Ctrl+C 2 lan de dung"
echo ""

# Luu PID vao file de script stop co the dung
echo "$BACKEND_PID" > "$SCRIPT_DIR/logs/backend.pid"
echo "$FRONTEND_PID" > "$SCRIPT_DIR/logs/frontend.pid"

# Giu script chay de khong bi tat
echo "⏸️  Script dang chay... (Nhan Ctrl+C de dung)"
wait
