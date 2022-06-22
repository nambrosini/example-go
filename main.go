package main

import (
	"io"
	"log"
	"net/http"
)

func hello(w http.ResponseWriter, req *http.Request) {
	io.WriteString(w, "Hello, World!")
}

func main() {
	http.HandleFunc("/", hello)

	log.Println("Listening on localhost:8080")
	err := http.ListenAndServe(":8080", nil)

	if err != nil {
		log.Fatal(err)
	}
}