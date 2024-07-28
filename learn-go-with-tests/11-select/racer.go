package racer

import (
	"net/http"
)

// func measureResponseTime(url string) time.Duration {
// 	tic := time.Now()
// 	http.Get(url)
// 	return time.Since(tic)
// }

// func Racer(a, b string) (winner string) {
// 	toc1 := measureResponseTime(a)
// 	toc2 := measureResponseTime(a)

//		if toc1 < toc2 {
//			return a
//		}
//		return b
//	}

func Racer(a, b string) (winner string) {
	select {
	case <-ping(a):
		return a
	case <-ping(b):
		return b
	}
}

func ping(url string) chan struct{} {
	ch := make(chan struct{})
	go func() {
		http.Get(url)
		close(ch)
	}()
	return ch
}
