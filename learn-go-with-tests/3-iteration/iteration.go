package iteration

func Repeat(character string) string {
	var repeated string = character
	for range 4 {
		repeated += character
	}
	return repeated
}
