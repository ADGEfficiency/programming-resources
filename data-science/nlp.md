---
id: nlp
aliases: []
tags:
  - nlp
  - natural-language-processing
  - tokenization
  - unicode
  - regex
created: 2026-01-25 13:00:00
---

[Introduction to NLP for Text](https://towardsdatascience.com/introduction-to-natural-language-processing-for-text-df845750fb63)

## Tokenization

Sentence, word, character

## Lemmatization & stemming

Stemming usually refers to a crude heuristic process that chops off the ends of words in the hope of achieving this goal correctly most of the time, and often includes the removal of derivational affixes.

Lemmatization usually refers to doing things properly with the use of a vocabulary and morphological analysis of words, normally aiming to remove inflectional endings only and to return the base or dictionary form of a word, which is known as the lemma.

## Stop words

Filtering out irrelevant words

## Feature extraction

### Bag of words

Similar docs have similar contents

Lose word order

1. design vocab of known words (`CountVectorizer`)
2. choose a measure of the presence of known words (i.e. counts)

Bag of words is not a good representation of language, especially when you have a small vocabulary. It ignores word order, word relationships and produces sparse vectors that is largely filled with zeros

### n-grams

Grouping `n` words

## Unicode & Character Sets

[The Absolute Minimum Every Software Developer Absolutely, Positively Must Know About Unicode and Character Sets (No Excuses!)](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/)

Every platonic letter in every alphabet is assigned a magic number by the Unicode consortium which is written like this: U+0639.

The English letter A would be U+0041

Code point + encoder -> encoding in memory as bytes

It does not make sense to have a string without knowing what encoding it uses.

## Regular Expressions

[pyregex.com](http://www.pyregex.com/)

Al Sweigart - Yes, It's Time to Learn Regular Expressions - [PyCon 2017](https://www.youtube.com/watch?v=abrcJ9MpF60)

```python
import re
regex = re.compile('pattern')
out = regex.search('haystack string')
print(out.group())
```

### Character classes

```
\d = digit
\w = alphanumeric
\s = space, tab, new line

\D = not a digit
\W = not alphanumeric
```

Custom character classes:

```
[aeioiAEIOU]   # all vowels
[^aeioiAEIOU]  # all non-vowels
[0-9a-zA-Z]    # same as \w
[\(\)]         # matches ( or )
```

### Specifying quantity

```
\d{3}-\d{3}-\d{4}   # pattern-quantity
\d+                  # one or more digits
\d{3,5}              # between 3 and 5
\d{3,}               # 3 or more
[aeiou]+             # one or more vowels
([^aeiou][aeiou])+   # consonant-vowel repeated
\d{1,3}(,\d{3})*    # comma formatted numbers
.*                   # match whatever
.*?                  # only matches first bit
.                    # any character except newline
```
