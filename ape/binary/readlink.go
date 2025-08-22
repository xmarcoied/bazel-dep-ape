package main

import (
	"fmt"
	"os"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Fprintf(os.Stderr, "readlink: missing operand\n")
		os.Exit(1)
	}

	for _, file := range os.Args[1:] {
		link, err := os.Readlink(file)
		if err != nil {
			os.Exit(1)
		}
		fmt.Println(link)
	}
}
