require 'csv'
require 'json'
# PARSING CSV FILE AND STORING EACH ROW AS AN ARRAY
table = CSV.parse(File.read('./data/umpires.csv'), headers: true)

# INITIALIZING WITH ZERO
umpires_nationality = Hash.new(0)
# MAPPING NATIONALITIES WITH NUMBER OF UMPIRES
table.each do |row|
  umpires_nationality[row[1]] += 1
end

umpires_nationality.delete('  India ')

# SHORTHAND NAMES
short_name = Array['NZ', 'ENG', 'SA', 'PAK', 'AUS', 'SL', 'WI', 'ZIM']
labels = {}
umpire_count = Array[] # contain COUNT of each nationality
umpires_nationality.each do |_key, value|
  umpire_count.append(value)
end

# creating labels for graph

short_name.each_with_index { |value, idx| labels[idx] = value }


my_data={}
umpires_nationality.each_with_index do |(key,value), index|
    my_data[short_name[index]]=value   
end    

umpires_obj=[]
#c1={}
p my_data
my_data.each do |key,value|
    c1={}
    c1["name"]=key
    c1["y"]=value
    c1["drilldown"]=key
      
    umpires_obj.append(c1)
end

File.open('./data/task3.json', 'w') do |f|
    
        
        f.puts umpires_obj.to_json

  end
