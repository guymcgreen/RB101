# show two different ways to put the expected "Four score and " in front of it.

famous_words = "seven years ago..."

puts famous_words1 = "Four score and #{famous_words}"

puts famous_words2 = "Four score and " + famous_words

famous_words.prepend("Four score and ")

"Four score and " << famous_words


