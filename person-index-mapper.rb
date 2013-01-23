#! /usr/bin/ruby
ARGF.each do |line|
  project_id,_,_,_,_,_,person_ids = line.chomp.split("\t", -1)
  person_ids.split("~~").each do |person_id|
    puts "#{person_id}\t#{project_id}"
  end
end