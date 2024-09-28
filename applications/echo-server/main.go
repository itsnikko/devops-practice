// Project forked and modified from https://digitalocean.com/community/tutorials/how-to-make-an-http-server-in-go
// Author: Kristin Davidson (https://github.com/aphistic)
// License: Creative Commons Attribution-Noncommercial-Sharealike 4.0 International

package main

import (
	"context"
	"errors"
	"fmt"
	"io"
	"net"
	"net/http"
	"text/template"
)

type contextKey string

const keyServerAddr contextKey = "serverAddr"

func getRoot(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	fmt.Printf("%s: got / request\n", ctx.Value(keyServerAddr))

	t, err := template.ParseFiles("./html/index.html")
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	data := struct {
		Title   string
		Message string
	}{
		Title:   "Hey, look, it's online.",
		Message: "Wow, such Go, very program.",
	}
	t.Execute(w, data)

}
func getEcho(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	fmt.Printf("%s: got /v1/echo request\n", ctx.Value(keyServerAddr))

	body, err := io.ReadAll(r.Body)
	if err != nil {
		http.Error(w, "Failed to read request body", http.StatusBadRequest)
		return
	}

	io.WriteString(w, fmt.Sprintf("You sent: %s\n", body))
}
func getHealth(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	fmt.Printf("%s: got /v1/health request\n", ctx.Value(keyServerAddr))

	w.WriteHeader(http.StatusOK)
	fmt.Fprintln(w, "OK")
}
func main() {
	mux := http.NewServeMux()
	mux.Handle("/images/", http.StripPrefix("/images/", http.FileServer(http.Dir("html/images"))))
	mux.HandleFunc("/", getRoot)
	mux.HandleFunc("/v1/echo", getEcho)
	mux.HandleFunc("/v1/health", getHealth)

	ctx := context.Background()
	server := &http.Server{
		Addr:    ":3333",
		Handler: mux,
		BaseContext: func(l net.Listener) context.Context {
			ctx = context.WithValue(ctx, keyServerAddr, l.Addr().String())
			return ctx
		},
	}

	err := server.ListenAndServe()
	if errors.Is(err, http.ErrServerClosed) {
		fmt.Printf("server closed\n")
	} else if err != nil {
		fmt.Printf("error starting server: %s\n", err)
	}
}
