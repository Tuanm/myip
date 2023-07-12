package main

import (
	"bytes"
	"log"
	"net/http"
	"os/exec"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		var out bytes.Buffer
		cmd := exec.Command("curl", "ifconfig.me")
		cmd.Stdout = &out
		err := cmd.Run()
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			w.Write([]byte(err.Error()))
		} else {
			w.Write(out.Bytes())
		}
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}
