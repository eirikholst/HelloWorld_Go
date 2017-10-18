package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/hello/go", handler)
	http.ListenAndServe(":8080", nil)
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello from Go!")
}