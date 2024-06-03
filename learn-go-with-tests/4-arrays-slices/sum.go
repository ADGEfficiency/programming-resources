package arrays

func Sum(numbers []int) int {
	var sum int
	for _, n := range numbers {
		sum += n
	}
	return sum
}

func SumAll(numbersToSum ...[]int) []int {
	var outputs []int
	for _, numbers := range numbersToSum {
		outputs = append(outputs, Sum(numbers))
	}
	return outputs
}

func SumAllTails(numbersToSum ...[]int) []int {
	var outputs []int
	for _, numbers := range numbersToSum {
		if len(numbers) == 0 {
			outputs = append(outputs, 0)
		} else {
			tail := numbers[1:]
			outputs = append(outputs, Sum(tail))
		}
	}
	return outputs
}
