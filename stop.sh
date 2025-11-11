#!/bin/bash

# ===================================================================
# LUXURY FASHION - STOP SCRIPT
# Script de dung Backend + Frontend
# ===================================================================

echo "╔══════════════════════════════════════════════════════════╗"
echo "║   LUXURY FASHION - STOP SCRIPT                           ║"
echo "║   Dang dung Backend + Frontend...                        ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Lay duong dan thu muc hien tai
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Doc PID tu file
if [ -f "$SCRIPT_DIR/logs/backend.pid" ]; then
    BACKEND_PID=$(cat "$SCRIPT_DIR/logs/backend.pid")
    if ps -p $BACKEND_PID > /dev/null; then
        echo "🛑 Dang dung Backend (PID: $BACKEND_PID)..."
        kill $BACKEND_PID
        echo "✅ Backend da dung"
    else
        echo "⚠️  Backend khong chay"
    fi
    rm "$SCRIPT_DIR/logs/backend.pid"
else
    echo "⚠️  Khong tim thay Backend PID"
fi

echo ""

if [ -f "$SCRIPT_DIR/logs/frontend.pid" ]; then
    FRONTEND_PID=$(cat "$SCRIPT_DIR/logs/frontend.pid")
    if ps -p $FRONTEND_PID > /dev/null; then
        echo "🛑 Dang dung Frontend (PID: $FRONTEND_PID)..."
        kill $FRONTEND_PID
        echo "✅ Frontend da dung"
    else
        echo "⚠️  Frontend khong chay"
    fi
    rm "$SCRIPT_DIR/logs/frontend.pid"
else
    echo "⚠️  Khong tim thay Frontend PID"
fi

echo ""
echo "✅ Tat ca service da duoc dung!"

