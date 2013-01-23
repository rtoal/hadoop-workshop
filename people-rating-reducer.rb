#! /usr/bin/ruby

def output(id, name, counts)
  counts.each {|r, c| puts "#{id}\t#{name}\t#{r}\t#{c}"}
end

last_id, name, counts = nil, "", Hash.new(0)
ARGF.each do |line|
  id, n, rating = line.chomp.split("\t", -1)
  if last_id.nil? or last_id == id
    last_id, name = id, (n.strip.empty? ? name : n)
  else
    output(last_id, name, counts)
    last_id, name, counts = id, n, Hash.new(0)
  end
  counts[rating] += 1 if not rating.strip.empty?
end
output(last_id, name, counts) if last_id

