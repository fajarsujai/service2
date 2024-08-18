package main

import (
    "fmt"
    "net/http"
    "os"
)

func main() {
    // Liveness probe handler
    http.HandleFunc("/live", func(w http.ResponseWriter, r *http.Request) {
        // Check application liveness here (e.g., check for hang, etc.)
        w.WriteHeader(http.StatusOK)
        w.Write([]byte("Liveness probe passed\n"))
    })

    // Readiness probe handler
    http.HandleFunc("/ready", func(w http.ResponseWriter, r *http.Request) {
        // Check application readiness here (e.g., database connection, etc.)
        ready := true // This should be based on actual checks
        if ready {
            w.WriteHeader(http.StatusOK)
            w.Write([]byte("Readiness probe passed\n"))
        } else {
            w.WriteHeader(http.StatusServiceUnavailable)
            w.Write([]byte("Readiness probe failed\n"))
        }
    })

    // Default handler
    http.HandleFunc("/service2", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello, service2!\n")
    })

    // Start the HTTP server
    port := os.Getenv("PORT")
    if port == "" {
        port = "3002"
    }
    fmt.Printf("Starting server on port %s...\n", port)
    if err := http.ListenAndServe(":"+port, nil); err != nil {
        fmt.Printf("Error starting server: %v\n", err)
    }
}