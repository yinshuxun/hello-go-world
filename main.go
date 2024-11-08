package main

import (
	"net/http"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

// Person 结构体定义
type Person struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

func main() {
	r := gin.Default()

	// 配置更宽松的 CORS
	config := cors.Config{
		AllowOrigins:     []string{"http://localhost:3000"},
		AllowMethods:     []string{"GET", "POST", "PUT", "PATCH", "DELETE", "HEAD", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Content-Length", "Content-Type"},
		AllowCredentials: true,
		MaxAge:           12 * time.Hour,
	}
	r.Use(cors.New(config))

	// 添加 API 路由
	r.GET("/api/people", handlePeople)

	// 启动服务器
	r.Run(":8080")
}

// getPeople 处理获取人员列表的请求
func handlePeople(c *gin.Context) {
	people := []Person{
		{ID: 1, Name: "张三"},
		{ID: 2, Name: "李四"},
		{ID: 3, Name: "王五"},
		{ID: 4, Name: "赵六"},
		{ID: 5, Name: "钱七"},
		{ID: 6, Name: "孙八"},
		{ID: 7, Name: "周九"},
		{ID: 8, Name: "吴十"},
		{ID: 9, Name: "郑十一"},
		{ID: 10, Name: "王十二"},
	}

	c.JSON(http.StatusOK, people)
}
