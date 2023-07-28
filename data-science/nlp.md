# [The Absolute Minimum Every Software Developer Absolutely, Positively Must Know About Unicode and Character Sets (No Excuses!)](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/)

Every platonic letter in every alphabet is assigned a magic number by the Unicode consortium which is written like this: U+0639.

The English letter A would be U+0041

Code point + encoder -> encoding in memory as bytes

It does not make sense to have a string without knowing what encoding it uses.
