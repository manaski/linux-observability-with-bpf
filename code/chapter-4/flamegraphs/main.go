package main

import (
    "fmt"
    "net/http"
    "time"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Printf("ok")
    time.Sleep(200*time.Millisecond)
    fmt.Fprintf(w, "hello world")
}

func main() {
    http.HandleFunc("/", indexHandler)
    http.ListenAndServe(":8000", nil)
}
