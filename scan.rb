str = "An example text to experiment with"

p str.scan(/\w+/) # scans for words of one or more word character and passes them into an array
# => ["An", "example", "text", "to", "experiment", "with"]

p str.scan(/.../) # scans for any 3 characters in a row and passes them into an array
# => ["An ", "exa", "mpl", "e t", "ext", " to", " ex", "per", "ime", "nt ", "wit"]

p str.scan(/(...)/) # scans for any 3 characters in a row and passes each one into a sub-array
# => [["An "], ["exa"], ["mpl"], ["e t"], ["ext"], [" to"], [" ex"], ["per"], ["ime"], ["nt "], ["wit"]]

p str.scan(/(...)(...)/) # scans for any 3 characters in a row and passes each pair into sub-arrays
# => [["An ", "exa"], ["mpl", "e t"], ["ext", " to"], [" ex", "per"], ["ime", "nt "]]

p str.scan(/(..)(..)(..)/) # scans for any 2 characters in a row and passes sets of 3 matches into sub-arrays
# => [["An", " e", "xa"], ["mp", "le", " t"], ["ex", "t ", "to"], [" e", "xp", "er"], ["im", "en", "t "]]

p str.scan(/e/) # scans for any instances of a char, e.g. 'e' and passes them into an array
# => ["e", "e", "e", "e", "e", "e"]

p str.scan(/exa/) # scans for any instances of a grouping of chars, e.g. 'e', 'a' and 'i' and passes each match into an array
# => ["exa"]

p str.scan(/[eai]/) # scans for any instances of each char included in square brackets, e.g. 'e', 'a' and 'i' and passes them into an array
# => ["e", "a", "e", "e", "e", "e", "i", "e", "i"]

# IN COMBINATION

p str.scan(/e/).count # scans for any instances of a char, e.g. 'e' and returns the number of matches
# => 6

# AND WITH BLOCK

str.scan(/\w+/) { |word| print "#{word}*" } # scans for words and this block prints each followed by an asterisk. NOTE: the scan itself returns the original string => "An example text to experiment with" but the block print, outputs the words with *s.
# => An*example*text*to*experiment*with*

puts
str.scan(/(.)(.)/) {|x,y| print y, x } # pairs each pair of characters and reverses them, i.e. index 0 and 1 swap places, index 2 and 3 sawp, etc.
# => nAe axpmelt xe tote pxremine tiwht

puts
str.scan(/(.)(.)(.)(.)/) {|a, b, c, d| print d, c, b, a } # groups chars into fours and reverses them, i.e. index 0, 1, 2 and 4 reverse, etc.
# => e nApmaxt el txee otrepxnemiiw t

puts
str.scan(/(.)(.)(.)/) {|a, b, c| print a, b } # groups chars into 3s and only prints the first 2, i.e. print index 0 and 1 but not 2, then print 3 and 4 but not 5, etc.
# => Anexmpe ex t epeimntwi

puts
str.scan(/text/) {|chars| puts chars } # scans for a particular substring and outputs any match one to a line.
# => text
