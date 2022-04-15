package main

import (
	"github.com/suborbital/reactr/api/tinygo/runnable" 
)

type Hey struct{}

func (h Hey) Run(input []byte) ([]byte, error) {
	return []byte("Hello, " + string(input)), nil
}

// initialize runnable, do not edit //
func main() {
	runnable.Use(Hey{})
}
