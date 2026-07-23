package dict

import "testing"

func assertString(t *testing.T, got, want string) {
	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}

func assertError(t *testing.T, got, want error) {
	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}

func TestSearch(t *testing.T) {

	dict := Dictionary{"test": "a test"}
	t.Run("known word", func(t *testing.T) {
		got, _ := dict.Search("test")
		want := "a test"
		assertString(t, got, want)
	})

	t.Run("unknown word", func(t *testing.T) {
		_, err := dict.Search("unknown")
		if err == nil {
			t.Fatal("expected to get an error")
		}
		assertError(t, err, ErrNotFound)
	})
}

func TestAdd(t *testing.T) {
	t.Run("new word", func(t *testing.T) {
		dict := Dictionary{}
		dict.Add("neu", "word")
		want := "word"
		got, err := dict.Search("neu")
		if err != nil {
			t.Fatal("should find added word: ", err)
		}
		assertString(t, want, got)
	})

	t.Run("existing word", func(t *testing.T) {
		dict := Dictionary{}
		dict.Add("neu", "word")
		got, _ := dict.Search("neu")
		err := dict.Add("neu", "word again")

		assertString(t, got, "word")
		assertError(t, err, ErrWordExists)
	})
}

func TestUpdate(t *testing.T) {
	t.Run("existing word", func(t *testing.T) {
		word := "test"
		dict := Dictionary{}
		dict.Add(word, "definition")
		dict.Update(word, "new definition")
		got, _ := dict.Search(word)
		assertString(t, got, "new definition")
	})

	t.Run("new word", func(t *testing.T) {
		word := "test"
		dict := Dictionary{}
		err := dict.Update(word, "new definition")
		assertError(t, err, ErrWordDoesNotExist)
	})
}

func TestDelete(t *testing.T) {
	t.Run("existing word", func(t *testing.T) {
		word := "test"
		dict := Dictionary{}
		dict.Add(word, "definition")
		dict.Delete(word)
		_, err := dict.Search(word)
		if err == nil {
			t.Fatal("expected to get an error")
		}
		assertError(t, err, ErrNotFound)
	})
}
