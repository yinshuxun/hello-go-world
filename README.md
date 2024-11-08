# Go + React 全栈开发示例

这是一个结合 Go 后端和 React 前端的全栈项目示例，展示了基本的前后端交互实现。

## 技术栈

### 后端
- Go 1.20
- gorilla/mux (HTTP 路由)
- rs/cors (跨域支持)

### 前端
- React 18
- Create React App
- TypeScript

## 项目结构
```
.
├── main.go              # Go 后端入口文件
├── go.mod              # Go 依赖管理
├── go.sum              # Go 依赖版本锁定
├── react-app/          # React 前端应用
│   ├── src/           
│   ├── package.json    
│   └── tsconfig.json   
├── start.sh           # 启动脚本
└── stop.sh            # 停止脚本
```

## 功能特点
- Go 后端提供 RESTful API
- React 前端实现用户界面
- 支持跨域请求
- 开发环境热重载

## 快速开始

### 前置要求
- Go 1.20 或以上
- Node.js 16 或以上
- npm 或 yarn

### 安装依赖

1. 后端依赖
```bash
go mod tidy
```

2. 前端依赖
```bash
cd react-app
npm install
```

### 运行项目

使用启动脚本：
```bash
./start.sh
```

或分别启动：

1. 启动后端服务
```bash
go run main.go
```

2. 启动前端开发服务器
```bash
cd react-app
npm start
```

访问：
- 前端页面：http://localhost:3000
- 后端 API：http://localhost:8080

### 停止服务

使用停止脚本：
```bash
./stop.sh
```

## 开发指南

### API 端点
- `GET /api/users` - 获取用户列表
- `POST /api/users` - 创建新用户

### 目录说明
- `main.go` - 后端主程序
- `react-app/src/` - React 源代码
- `react-app/src/App.js` - React 主组件

## 部署

### 构建前端
```bash
cd react-app
npm run build
```

### 构建后端
```bash
go build -o server
```

## 贡献指南
1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交改动 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 提交 Pull Request

## 许可证
MIT License