package main

import (
	"fmt"
	"html/template"
	"net/http"
)

// 定义一个基础模板
func main() {
	http.HandleFunc("/home", home)
	http.HandleFunc("/xss", xss)
	err := http.ListenAndServe(":9090", nil)
	if err != nil {
		fmt.Printf("Http serve start failed, err:%v", err)
		return
	}
}

func home(w http.ResponseWriter, r *http.Request) {
	t, err := template.New("./index.tmpl").
		Delims("{[", "]}").ParseFiles("./index.tmpl")
	if err != nil {
		fmt.Printf("Templage Parse files failed, err:%v", err)
		return
	}
	t.Execute(w, "home")
}

func xss(w http.ResponseWriter, r *http.Request) {
	// 定义模板
	// 解析模板
	t, err := template.ParseFiles("./xss.tmpl")
	if err != nil {
		fmt.Printf("Templage Parse files failed, err:%v", err)
		return
	}
	// 渲染模板
	// 这里用户就会在其中运行一段js脚本
	// 在做网站时，不能相信用户提交的内容。
	name := "<script>alert(133)</script>"
	t.Execute(w, name)
}
