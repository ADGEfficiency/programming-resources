package main

import "testing"
import "bytes"

func TestGreet(t *testing.T) {

	buf := new(bytes.Buffer)
	Greet(buf, "adam")

	got := buf.String()
	want := "Hello, adam"

	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}
