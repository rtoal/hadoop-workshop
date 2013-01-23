#! /usr/bin/ruby
ARGF.each do |line|
  line.downcase.scan(/[a-z']+/).each do |word|
    puts "#{word}\t1"
  end
end

