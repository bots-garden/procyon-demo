package main

import (
	"github.com/suborbital/reactr/api/tinygo/runnable"
)

type HeyNext struct{}

func (h HeyNext) Run(input []byte) ([]byte, error) {
	return []byte("<h1>Hey People 🎃</h1>"), nil
}

// initialize runnable, do not edit //
func main() {
	runnable.Use(HeyNext{})
}
