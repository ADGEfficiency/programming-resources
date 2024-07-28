package racer

import "testing"
import "net/http/httptest"
import "net/http"
import "time"

func TestRacer(t *testing.T) {
	slowServer := makeServer(20 * time.Millisecond)
	fastServer := makeServer(0 * time.Millisecond)
	defer slowServer.Close()
	defer fastServer.Close()

	slowURL := slowServer.URL
	fastURL := fastServer.URL

	want := fastURL
	got := Racer(slowURL, fastURL)

	if got != want {
		t.Errorf("got %q, want %q", got, want)
	}
}

func makeServer(delay time.Duration) *httptest.Server {
	return httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		time.Sleep(delay)
		w.WriteHeader(http.StatusOK)
	}))
}
