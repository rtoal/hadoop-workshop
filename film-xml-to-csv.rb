# Produces CVS for film records assuming each film element is
# on one line of STDIN.

# Warning: This is a slow hack, as it uses the REXML document
# parsing, instead of the SAX-style (streaming) parsing.

require 'rexml/document'
include REXML

ARGF.each do |line|
  doc = Document.new line
  top_elements = doc.root.elements
  
  project_id = top_elements['PROJECT_ID'].text
  names = top_elements['TITLES'].elements.map do |title| 
    title.elements['NAME'].text
  end.join("~~")
  status = top_elements['STATUS'].text
  type = top_elements['TYPE'].text
  ratings = top_elements['RATINGS'].elements.map do |rating| 
    rating.elements['VALUE'].text
  end.join("~~")
  origins = top_elements['COUNTRIES_OF_ORIGIN'].elements.map do |country| 
    country.text
  end.join("~~")
  person_ids = top_elements['PERSON_CREDITS'].elements.map do |credit|
    credit.elements['PERSON_ID'].text
  end.sort.uniq.join("~~")
  puts [project_id, names, status, type, origins, ratings, person_ids].join("\t")
end
