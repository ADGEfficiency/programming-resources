package structs

import "testing"

func checkPerimeter(t *testing.T, got, want float64) {
	if got != want {
		t.Errorf("got %.2g want %.2g", got, want)
	}
}

func checkArea(t *testing.T, shape Shape, want float64) {
	t.Helper()
	got := shape.Area()
	if got != want {
		t.Errorf("got %.2g want %.2g", got, want)
	}
}

func TestPerimeter(t *testing.T) {
	rectangle := Rectangle{10.0, 10.0}
	got := Perimeter(rectangle)
	want := 40.0
	checkPerimeter(t, got, want)
}

func TestArea(t *testing.T) {

	t.Run("rectangles", func(t *testing.T) {
		sh := Rectangle{12.0, 6.0}
		want := 72.0
		checkArea(t, sh, want)
	})

	t.Run("circles", func(t *testing.T) {
		sh := Circle{10}
		want := 314.1592653589793
		checkArea(t, sh, want)
	})
}

func TestAreaTable(t *testing.T) {
	areaTests := []struct {
		name  string
		shape Shape
		want  float64
	}{
		{"rect", Rectangle{12, 6}, 72.0},
		{"circ", Circle{10}, 314.1592653589793},
		{"tri", Triangle{12, 6}, 36.0},
	}

	for _, tt := range areaTests {
		got := tt.shape.Area()
		want := tt.want
		if got != want {
			t.Errorf("%#v got %.2g want %.2g", tt.shape, got, want)
		}
	}

}
