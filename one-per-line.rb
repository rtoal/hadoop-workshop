#!/usr/bin/env ruby
xml = nil
ARGF.each do |line|
  line.strip!

  if line.include?("<FILM")
    xml = line
  else
    xml << line if not xml.nil?
  end

  if line.include?("</FILM>")
    puts xml if not xml.nil?
    xml = nil
  end
end
