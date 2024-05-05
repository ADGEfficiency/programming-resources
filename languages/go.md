[dgryski/go-perfbook](https://github.com/dgryski/go-perfbook) - Thoughts on Go performance optimization

[Go: the Good, the Bad and the Ugly](https://bluxte.net/musings/2018/04/10/go-good-bad-ugly/)

[Einstein Analytics and Go](https://stackoverflow.blog/2019/10/07/how-salesforce-converted-einstein-analytics-to-go/)

[Go at Google: Language Design in the Service of Software Engineering](https://talks.golang.org/2012/splash.article)

[Notes on the Go translation of Reposurgeon](https://gitlab.com/esr/reposurgeon/blob/master/GoNotes.adoc)

[Go By Example](https://gobyexample.com/)

[Three Months of Go (from a Haskeller's perspective)](https://memo.barrucadu.co.uk/three-months-of-go.html)

[templ](https://templ.guide/) - Create components that render fragments of HTML and compose them to create screens, pages, documents, or apps.

[hoanhan101/algo: 101+ coding interview problems in Go](https://github.com/hoanhan101/algo)

[Performance comparison: counting words in Python, Go, C++, C, AWK, Forth, and Rust](https://benhoyt.com/writings/count-words/)

# HATE Stack

[The HATE Stack - Simple and Efficient](https://www.youtube.com/watch?v=bti-bnGbyak) - [awesome-club/hate-stack](https://github.com/awesome-club/hate-stack)


---

[soypat/gopherlings: 📘️ Learn Go by fixing tiny incorrect programs](https://github.com/soypat/gopherlings)

[mauricioabreu/golings: rustlings but for golang this time](https://github.com/mauricioabreu/golings/)

## Golings Learnings

Declare and initialize variables:

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

Typing in function definition and return:

```go
import "fmt"

func f(n int) int {
	fmt.Println(n)
	return n * 2
}
```

Printing:

```go
import "fmt"

fmt.Println("print a line")

const n int = 5
fmt.Printf("formatted string, n=%d\n", n)
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

Types:

```go
int
float32
float64
string
```

Arrays - fixed size sequence (can't change size), elements same type:

```go
var colors [3]string
```
