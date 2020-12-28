package main

import (
	"fmt"
	"html/template"
	"net/http"
)

type User struct {
	Age    int
	gender string
	Name   string
}

func main() {
	http.HandleFunc("/", sayHello)
	err := http.ListenAndServe(":9090", nil)
	if err != nil {
		fmt.Printf("Http server start failed, err : %v", err)
		return
	}
}
func sayHello(w http.ResponseWriter, r *http.Request) {
	t, err := template.ParseFiles("./hello.tmpl")
	if err != nil {
		fmt.Printf("template is failed, err:%v", err)
		return
	}
	u1 := User{
		Name:   "First Name",
		Age:    11,
		gender: "e",
	}
	// name := "aaaaaa"
	m1 := map[string]interface{}{
		"Name":   "mapName",
		"Age":    12,
		"gender": "man",
	}

	hobbyList := []string{
		"a",
		"b",
		"c",
	}

	t.Execute(w, map[string]interface{}{
		"u1":    u1,
		"m1":    m1,
		"hobby": hobbyList,
	})
}
