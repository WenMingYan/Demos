package main

import (
	"fmt"
	"net/http"
	"text/template"
)

// 定义一个基础模板，
func main() {
	http.HandleFunc("/index", index)
	http.HandleFunc("/tmplIndex", tmplIndex)
	http.HandleFunc("/home", home)
	http.HandleFunc("/tmplHome", tmplHome)
	err := http.ListenAndServe(":9090", nil)
	if err != nil {
		fmt.Printf("Http serve start failed, err:%v", err)
		return
	}
}

func home(w http.ResponseWriter, r *http.Request) {
	t, err := template.ParseFiles("./home.tmpl")
	if err != nil {
		fmt.Printf("Templage Parse files failed, err:%v", err)
		return
	}
	t.Execute(w, "home")
}

func tmplHome(w http.ResponseWriter, r *http.Request) {
	t, err := template.ParseFiles("./templates/base.tmpl", "./templates/home.tmpl")
	if err != nil {
		fmt.Printf("Templage Parse files failed, err:%v", err)
		return
	}
	t.ExecuteTemplate(w, "home.tmpl", "home")
}

func index(w http.ResponseWriter, r *http.Request) {
	t, err := template.ParseFiles("./index.tmpl")
	if err != nil {
		fmt.Printf("Templage Parse files failed, err:%v", err)
		return
	}
	t.Execute(w, "index")
}

func tmplIndex(w http.ResponseWriter, r *http.Request) {
	t, err := template.ParseFiles("./templates/base.tmpl", "./templates/index.tmpl")
	if err != nil {
		fmt.Printf("Templage Parse files failed, err:%v", err)
		return
	}
	// t.Execute(w, "index")
	t.ExecuteTemplate(w, "index.tmpl", "index")
}
