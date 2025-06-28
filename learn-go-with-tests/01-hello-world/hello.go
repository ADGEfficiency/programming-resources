package main

import "fmt"

const (
	spanish = "spanish"
	french  = "french"

	prefixEnglish      = "Hello, "
	spanishHelloPrefix = "Hola, "
	frenchHelloPrefix  = "Bonjour, "
)

func Hello(name string, language string) string {
	if name == "" {
		name = "World"
	}
	return greetingPrefix(language) + name
}

func greetingPrefix(language string) (prefix string) {
	prefix = prefixEnglish

	switch language {
	case spanish:
		prefix = spanishHelloPrefix
	case french:
		prefix = frenchHelloPrefix
	}
	return
}

func main() {
	fmt.Println(Hello("", "english"))
}
