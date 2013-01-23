#! /usr/bin/ruby
last_word, total = nil, 0
ARGF.each do |line|
  word, count = line.split("\t")
  if last_word && word != last_word
    puts "#{last_word}\t#{total}"
    total = 0
  end
  last_word, total = word, total + count.to_i
end
puts "#{last_word}\t#{total}" if last_word
