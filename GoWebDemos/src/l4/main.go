package main

import (
	"fmt"
	"net/http"
	"text/template"
)

func main() {
	http.HandleFunc("/", f1)
	http.HandleFunc("/tmpl", demo1)
	err := http.ListenAndServe(":9090", nil)
	if err != nil {
		fmt.Printf("Http serve start failed,err:%v", err)
		return
	}

}

func demo1(w http.ResponseWriter, r *http.Request) {
	t, err := template.ParseFiles("./t.tmpl", "ul.tmpl")
	if err != nil {
		fmt.Printf("parse template failed,err : %v", err)
		return
	}
	t.Execute(w, "aaa")
}

func f1(w http.ResponseWriter, r *http.Request) {
	// 定义一个函数，kua
	// 要么只要一个返回值，要么只有两个返回值，第二个一定要是err
	kua := func(name string) (string, error) {
		return name + "kakoi", nil
	}
	// 定义模板
	// 解析模板
	t := template.New("f.tmpl")
	// 告诉模板引擎，需要一个自定义函数
	t.Funcs(template.FuncMap{
		"kua": kua,
	})

	_, err := t.ParseFiles("./f.tmpl")
	if err != nil {
		fmt.Printf("parse template failed,err : %v", err)
		return
	}
	name := "xiaowangzi"
	// 渲染模板
	t.Execute(w, name)
}
