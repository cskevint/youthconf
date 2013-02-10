filename = 'uhj.csv'
file = File.new(filename, 'r')

uhj_cities = []

file.each_line("\n") do |row|
  #row = row.gsub("Istanbul (2)", "Istanbul I, Istanbul II")
  row = row.gsub("Istanbul (2)", "Istanbul")
  uhj_cities = row.split(",").map {|c| c[0..(c.index("(")-1)].strip rescue c.strip }
  #uhj_cities = row.split(",").map {|c| c.strip }
end

#puts "UHJ Cities: #{uhj_cities.count} #{uhj_cities}"
  
filename = 'conferences.csv'
file = File.new(filename, 'r')

conferences = []
cities = []
states = []
countries = []
google = []
special = []

file.each_line("\n") do |row|
  columns = row.split(",").map {|c| c.strip }
  
  cities << columns.first
  countries << columns.last
  states << columns[1] if columns.count >= 3 && !columns[1].empty?
  google << columns[2] if columns.count >= 4 && !columns[2].empty?
  special << columns[3] if columns.count >= 5 && !columns[3].empty?
  
  conference = {
    city: columns.first,
    country: columns.last
  }
  conference[:state_province] = columns[1] if columns.count >= 3 && !columns[1].empty?
  conference[:google] = columns[2] if columns.count >= 4 && !columns[2].empty?
  conference[:special] = columns[3] if columns.count >= 5 && !columns[3].empty?

  conferences << conference
end

#puts "UHJ Cities: #{uhj_cities.count} #{uhj_cities}"
#puts "Cities: #{cities.count} #{cities}"

found = []
not_found = []
uhj_not_found = []

cities.each do |city|
  if uhj_cities.select { |c| c == city}.empty?
    not_found << city
  else
    found << city
  end
end

uhj_cities.each do |city|
  if cities.select { |c| c == city}.empty?
    uhj_not_found << city
  end
end


#puts "UHJ Not Found Cities: #{uhj_not_found.count} #{uhj_not_found}"
#puts "\n"
#puts "Not Found Cities: #{not_found.count} #{not_found}"
#puts "\n"
#puts "Found Cities: #{found.count} #{found}"
#puts "\n"
#puts "Google Helpers: #{google.count} #{google}"

require 'yaml'
puts conferences.to_yaml