package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	// 指定用户使用GET请求访问/hello时，执行sayGenHello函数
	r.GET("/hello", sayGinHello)

	r.GET("/book", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"method": "GET",
		})
	})
	r.POST("/book", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"method": "POST",
		})
	})
	r.PUT("/book", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"method": "PUT",
		})
	})
	r.DELETE("/book", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"method": "DELETE",
		})
	})

	r.Run(":9090") // 默认是8080端口
}

func sayGinHello(c *gin.Context) {
	c.JSON(200, gin.H{
		"message": "Hello golang!",
	})

}

/// ------------------------- 默认http --------------------------

func main1() {
	http.HandleFunc("/", sayhelloName) // 设置访问的路由
	http.HandleFunc("/wmy", sayYeah)
	err := http.ListenAndServe(":9090", nil) // 设置监听的端口
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}

}

func sayhelloName(w http.ResponseWriter, r *http.Request) {
	fmt.Println("--------------------------------------")
	r.ParseForm()       // 解析参数，默认是不会解析的
	fmt.Println(r.Form) // 这些信息是输出到服务器端的打印信息
	fmt.Println("path", r.URL.Path)
	fmt.Println("scheme", r.URL.Scheme)
	fmt.Println(r.Form["url_long"])
	for k, v := range r.Form {
		fmt.Println("key:", k)
		fmt.Println("val:", strings.Join(v, ""))
	}
	fmt.Fprintf(w, "<h1>Hello world!<h1><h2>how are you</h2>") // 这个写入到 w 的是输出到客户端的
}

func sayYeah(w http.ResponseWriter, r *http.Request) {
	b, _ := ioutil.ReadFile("hello.html")
	fmt.Fprintln(w, string(b))
}
