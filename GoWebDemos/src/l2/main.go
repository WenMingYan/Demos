package main

import (
	"fmt"
	"html/template"
	"net/http"
)

func main() {
	http.HandleFunc("/", sayHelloWorld)
	err := http.ListenAndServe(":9090", nil)
	if err != nil {
		fmt.Printf("Http server start failed, err:%v", err)
		return
	}
}

func sayHelloWorld(w http.ResponseWriter, r *http.Request) {
	// 已定义了hello.tmpl模板
	// 解析模板
	t, err := template.ParseFiles("./hello.tmpl")
	if err != nil {
		fmt.Printf("Parse template failed, err:%v", err)
		return
	}
	// 渲染模板
	name := "aaaaa"
	err = t.Execute(w, name)
	if err != nil {
		fmt.Printf("Render template failed,err: %v", err)
		return
	}
}
