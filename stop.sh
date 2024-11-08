#!/bin/bash

echo "正在关闭服务..."

# 关闭占用 3000 端口的进程（React）
kill $(lsof -t -i:3000) 2>/dev/null || true

# 关闭占用 8080 端口的进程（Go）
kill $(lsof -t -i:8080) 2>/dev/null || true

echo "服务已关闭" 