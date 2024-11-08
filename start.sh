#!/bin/bash

# 创建一个临时文件来存储进程 ID
mkdir -p tmp
GO_PID_FILE="tmp/go-server.pid"
REACT_PID_FILE="tmp/react-server.pid"

# 清理函数
cleanup() {
    echo "正在关闭服务..."
    
    # 关闭 React 服务
    if [ -f "$REACT_PID_FILE" ]; then
        kill $(cat "$REACT_PID_FILE") 2>/dev/null || true
        rm "$REACT_PID_FILE"
    fi
    
    # 关闭 Go 服务
    if [ -f "$GO_PID_FILE" ]; then
        kill $(cat "$GO_PID_FILE") 2>/dev/null || true
        rm "$GO_PID_FILE"
    fi
    
    exit 0
}

# 注册清理函数
trap cleanup EXIT INT TERM

# 终止可能已经运行的进程
kill $(lsof -t -i:8080) 2>/dev/null || true
kill $(lsof -t -i:3000) 2>/dev/null || true

# 启动 Go 服务
echo "启动 Go 服务..."
go run main.go & 
echo $! > "$GO_PID_FILE"

# 等待 Go 服务启动
sleep 2

# 启动 React 项目
echo "启动 React 项目..."
cd react-app
npm start &
echo $! > "$REACT_PID_FILE"

# 等待所有后台进程
wait
