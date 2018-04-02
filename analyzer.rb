#ARGV[0] gets the file to open from the command line
# ruby analyzer.rb text.txt

lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join
stopwords = %w{the a by on for of are with just but and to the my I has some in}

#Counts the characters
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length

#Counts the words, sentences, paragraphs
word_count = text.split.length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length

#Make a list of words that aren't stopwords, count them, calc
#percentage of non-stop words against all words
all_words = text.scan(/\w+/)
good_words = all_words.select { |word| !stopwords.include?(word)}
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

#Summarize the text by cherry picking some choice sentences
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

#Gives analysis back to the user
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{sentence_count / paragraph_count} sentences per paragraph (avg)"
puts "#{word_count / sentence_count} words per sentence (avg)"
puts "#{good_percentage}% of words are non-filler words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
