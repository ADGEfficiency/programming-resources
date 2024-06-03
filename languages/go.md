[dgryski/go-perfbook](https://github.com/dgryski/go-perfbook) - Thoughts on Go performance optimization

[Go: the Good, the Bad and the Ugly](https://bluxte.net/musings/2018/04/10/go-good-bad-ugly/)

[Einstein Analytics and Go](https://stackoverflow.blog/2019/10/07/how-salesforce-converted-einstein-analytics-to-go/)

[Go at Google: Language Design in the Service of Software Engineering](https://talks.golang.org/2012/splash.article)

[Notes on the Go translation of Reposurgeon](https://gitlab.com/esr/reposurgeon/blob/master/GoNotes.adoc)

[Three Months of Go (from a Haskeller's perspective)](https://memo.barrucadu.co.uk/three-months-of-go.html)

[templ](https://templ.guide/) - Create components that render fragments of HTML and compose them to create screens, pages, documents, or apps.

[hoanhan101/algo: 101+ coding interview problems in Go](https://github.com/hoanhan101/algo)

[Performance comparison: counting words in Python, Go, C++, C, AWK, Forth, and Rust](https://benhoyt.com/writings/count-words/)

# HATE Stack

[The HATE Stack - Simple and Efficient](https://www.youtube.com/watch?v=bti-bnGbyak) - [awesome-club/hate-stack](https://github.com/awesome-club/hate-stack)

---

## Learning Go

[A Tour of Go](https://go.dev/tour/welcome/1)

[learn Go with tests](https://quii.gitbook.io/learn-go-with-tests)

[Effective Go](https://go.dev/doc/effective_go)

[Go by Example](https://gobyexample.com/)

## Textbooks

[Let’s Go! A start-to-finish guide to building web apps with Go](https://lets-go.alexedwards.net/)

[Let’s Go Further! Advanced patterns for APIs and web applications in Go](https://lets-go-further.alexedwards.net/)

## Interactive

[soypat/gopherlings: 📘️ Learn Go by fixing tiny incorrect programs](https://github.com/soypat/gopherlings)

[mauricioabreu/golings: rustlings but for golang this time](https://github.com/mauricioabreu/golings/)

Declare and initialize variables - requires a `var` keyword and the type:

```go
var x = 5
var int x = 5

// inside a function - but cannot define type
x := 5
```


Constants:

```go
const Pi = 3.14
```

Printing:

```go
import "fmt"

fmt.Println("print a line")

const n int = 5
fmt.Printf("formatted string, n=%d\n", n)
```

Placeholders:

`%q` - quoted string

```go
t.Errorf("got %q want %q", got, want)
```

`%d` - integers

```go
t.Errorf("int: %d", 5)
```

Conditionals:

```go
if condition {
	return a
else if {
    return b
}
} else {
	return b
}
```

Switch:

```go
status := "open"

switch {
case status == "open":
	fmt.Println("status is open")
case status == "closed":
	fmt.Println("status is closed")
}
```

Can also write with the conditions as constants:

```go
const (
	spanish = "spanish"
	french  = "french"

	prefixEnglish      = "Hello, "
	spanishHelloPrefix = "Hola, "
	frenchHelloPrefix  = "Bonjour, "
)
switch language {
case spanish:
	prefix = spanishHelloPrefix
case french:
	prefix = frenchHelloPrefix
}

```

Types:

```go
int
float32
float64
string
```

## Functions

Typing in function definition and return:

```go
import "fmt"

func f(n int) int {
	fmt.Println(n)
	return n * 2
}
```

Varidic parameters - varying number of arguments of same type:

```go
func SumAll(numbersToSum ...[]int) []int {
```

Named return values:

```go
func Hello(name string, language string) prefix string {
	prefix := prefixEnglish
	switch language {
	case spanish:
		prefix = spanishHelloPrefix
	case french:
		prefix = frenchHelloPrefix
	}
	return
}
```



## Arrays

Arrays - fixed size sequence (can't change size), elements same type.  When you pass an array to a function, it is copied.

```go
var colors [3]string
```

## Slices

Slices - dynamically sized - not fixed length

- create an empty array of zeroes, initialized with 3 zeroes, capacity 10:

```go
a := make([]int, 3, 10)
```

Indexing:

```go
lastTwoNames := names[2:]
```

Appending to slice array:

```go
names := []string{"John", "Maria", "Carl", "Peter"}
names = append(names, "Adam")
```

## Maps

Like dicts

```go
m := make(map[string]int)
m["John"] = 30
```

When extracting from the map, you also get a boolean value indicating if the key exists:

```go
phone, exists := phoneBook["Ana"]
```

Deleting from a map:

```go
delete()
```

## Iteration

There are only `for` loops in Go (no `while`).

## For Loops

```go
for i := 0; i < 5; i++ {
	repeated = repeated + character
}

for range 5 {
	repeated = repeated + character
}
```

# Iterating Arrays

```go
even_numbers := []int{2, 4, 6, 8, 10}

for n, v := range even_numbers {
	fmt.Printf("%d %d is even\n", n, v)
}
```

# Iterating Maps

```go
phoneBook := map[string]string{
	"Ana":  "+01 101 102",
	"John": "+01 333 666",
}

for name, phone := range phoneBook {
	fmt.Printf("%s has the %s phone\n", name, phone)
}
```

# Structs

No commas:

```go
type Person struct {
	name string
	age  int
}

var person = Person{"Bob", 20}
```

Named arguments:

```go
var person = Person{name: "Bob", age: 20}
```

Defining functions on structs:

```go
// structs3
// Make me compile!
package main

import "fmt"

type Person struct {
	firstName string
	lastName  string
}

func (p Person) FullName() string {
	return p.firstName + " " + p.lastName
}

func main() {
	person := Person{firstName: "Maurício", lastName: "Antunes"}
	fmt.Printf("Person full name is: %s\n", person.FullName()) // here it must output Person full name is: Maurício Antunes
}
```

## Anonymous functions

```go
package main

import "fmt"

func main() {
	func(name string) {
		fmt.Printf("Hello %s", name)
	}("adam")
}
```

## concurrent

```go
import (
	"bytes"
	"fmt"
	"sync"
	"testing"
)

func TestPrinter(t *testing.T) {
	var buf bytes.Buffer
	print(&buf)

	out := buf.String()

	for i := 0; i < 3; i++ {
		want := fmt.Sprintf("Hello from goroutine %d!", i)
		if !bytes.Contains([]byte(out), []byte(want)) {
			t.Errorf("Output did not contain expected string. Wanted: %q, Got: %q", want, out)
		}
	}
}

func print(buf *bytes.Buffer) {
	var wg sync.WaitGroup
	var mu sync.Mutex

	goroutines := 3

	for i := 0; i < goroutines; i++ {
		wg.Add(1)
		go func(i int) {
			defer wg.Done()
			mu.Lock()
			fmt.Fprintf(buf, "Hello from goroutine %d!\n", i)
			mu.Unlock()
		}(i)
	}

	wg.Wait()
}
```

## Modules

```shell-session
$ go mod init hello
```

Run app:

```shell-session
$ go run hello.go
```

## Testing

The test function must start with the word Test

The test function takes one argument only t *testing.T

To use the *testing.T type, you need to import "testing", like we did with fmt in the other file*

## Coverage

```shell-session
go test -cover
```

## Test Runs

In `_test.go`

```go
package arrays

import "testing"

func TestSum(t *testing.T) {

	// helper function, only available in this scope
	checkSums := func(t *testing.T, got, want []int) {
		t.Helper()
		if !slices.Equal(got, want) {
			t.Errorf("got %v want %v", got, want)
		}
	}

	t.Run("collection of 5 numbers", func(t *testing.T) {
		// logic
	})
	t.Run("collection of 4 numbers", func(t *testing.T) {
		// logic
	})

}
```

## Test Examples

Begin with `Example`, live in `_test.go`:

```go
func ExampleAdd() {
	sum := ADD(1, 5)
	fmt.Println(sum)
	// Output: 6
}
```

In `_test.go`:

## Test Benchmarks

```go
func BenchmarkRepeat(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Repeat("a")
	}
}
```

```shell-session
go test -bench=.
```

## Documentation

Will show examples:

```shell-session
go install -v golang.org/x/tools/cmd/godoc@latest
godoc -http=:6060
```

## Importing

Not really a thing:

```go
# hello.go
package main

func Hello() {

}
```

```go
# test_hello.go
package main

func TestHello() {
// do stuff with Hello func
}
```
