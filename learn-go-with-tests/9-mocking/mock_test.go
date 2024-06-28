package main

import (
	"bytes"
	"reflect"
	"testing"
	"time"
)

func TestCountdown(t *testing.T) {

	t.Run("print", func(t *testing.T) {
		buffer := &bytes.Buffer{}
		Countdown(buffer, &SpySleeper{})
		got := buffer.String()
		want := `3
2
1
Go!`
		if got != want {
			t.Errorf("got %q want %q", got, want)
		}

	})
	t.Run("order", func(t *testing.T) {
		spy := &SpySleeper{}
		Countdown(spy, spy)
		order := []string{
			write,
			sleep,
			write,
			sleep,
			write,
			sleep,
			write,
		}

		if !reflect.DeepEqual(spy.Calls, order) {
			t.Errorf("wanted calls %v got %v", order, spy.Calls)
		}
	})
}

func TestConfig(t *testing.T) {
	sp := &SpyTime{}
	sleeper := ConfigurableSleeper{5 * time.Second, sp.Sleep}
	sleeper.Sleep()

	if sp.durationSlept != 5*time.Second {
		t.Errorf("should have slept for 5 seconds but slept for %v", sp.durationSlept)
	}

}
