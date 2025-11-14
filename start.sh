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
    echo "✅ NPM da cai dat: $NPM_VERSION"
else
    echo "❌ NPM CHUA CAI DAT!"
    exit 1
fi

echo ""
echo "✅ Tat ca yeu cau da duoc kiem tra!"
echo ""

# ===================================================================
# BUOC 2: SETUP BACKEND
# ===================================================================
echo "📦 Buoc 2: Setup Backend (Spring Boot)..."
echo ""

cd "$BACKEND_DIR"

if [ -f "pom.xml" ]; then
    echo "🔨 Dang build Backend voi Maven..."
    mvn clean install -DskipTests

    if [ $? -eq 0 ]; then
        echo "✅ Backend build thanh cong!"
    else
        echo "❌ Backend build that bai!"
        exit 1
    fi
else
    echo "❌ Khong tim thay pom.xml trong $BACKEND_DIR"
    exit 1
fi

echo ""

# ===================================================================
# BUOC 3: SETUP FRONTEND
# ===================================================================
echo "📦 Buoc 3: Setup Frontend (Vue 3 + Vite)..."
echo ""

cd "$FRONTEND_DIR"

if [ -f "package.json" ]; then
    echo "🔨 Dang cai dat dependencies..."
    npm install

    if [ $? -eq 0 ]; then
        echo "✅ Frontend dependencies da cai dat!"
    else
        echo "❌ Frontend setup that bai!"
        exit 1
    fi
else
    echo "❌ Khong tim thay package.json trong $FRONTEND_DIR"
    exit 1
fi

echo ""

# ===================================================================
# BUOC 4: CHAY BACKEND & FRONTEND
# ===================================================================
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   STARTING BACKEND & FRONTEND                            ║"
echo "║   Backend: http://localhost:8080/api                     ║"
echo "║   Frontend: http://localhost:5173                        ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Chay Backend trong background
cd "$BACKEND_DIR"
echo "🚀 Dang khoi dong Backend..."
mvn spring-boot:run &
BACKEND_PID=$!

# Cho Backend startup
sleep 10

# Chay Frontend
cd "$FRONTEND_DIR"
echo "🚀 Dang khoi dong Frontend..."
npm run dev

# Cleanup khi thoat
trap "kill $BACKEND_PID" EXIT

