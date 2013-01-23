#! /usr/bin/ruby
ARGF.each do |line|
  record = line.chomp.split("\t", -1)
  if record.length == 7
    rating = record[5] == "" ? "Unknown" : record[5]
    record[6].split("~~").each do |id|
      puts "#{id}\t\t#{rating}"
    end
  else
    puts "#{record[0]}\t#{record[1]}\t"
  end
end