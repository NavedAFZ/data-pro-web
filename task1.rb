require 'csv'
require 'json'
# books = []

# CSV.foreach('./data/umpires.csv', headers: true) do |row|
#   books << [row['umpire'], row['nationality']]
# end
# columns = [:umpire, :nationality]
# Book.import(columns, books, validate: false)
# p books

# books = CSV.readlines('./data/umpires.csv', headers:true).map{|row| row.values_at('Umpire') }
# p books

# table = CSV.parse(File.read('./data/umpires.csv'), headers: true)
# table.each do |tab|
#     books<< [tab['Umpire']]
# end    
# p books




table = CSV.parse(File.read('./data/deliveries.csv'), headers: true)
# column 3 in deliveries.csv contain name of batting teams
short_name = Array['SH', 'RCB', 'MI', 'Pune', 'GL', 'KKR', 'Punj', 'DD', 'CSK', 'RR', 'DC', 'Kochi', 'PW']
# initialise all teams runs scored as zero
each_team_score = Hash.new(0)
# row wise traversal of csv file
table.each do |row|
  each_team_score[row['batting_team']] += row['total_runs'].to_i
end
each_team_score['Rising Pune Supergiant'] += each_team_score['Rising Pune Supergiants']
each_team_score.delete('Rising Pune Supergiants')


labels = {}
scores = Array[] # contain score of each team
each_team_score.each do |_key, value|
  scores.append(value)
end

# creating labels for graph

short_name.each_with_index { |name, idx| labels[idx] = name }

my_data={}

each_team_score.each_with_index do |(_key, value), index|
    my_data[short_name[index]]=value
end    
p my_data

ar=[]
#c1={}
my_data.each do |key,value|
    c1={}
    c1["name"]=key
    c1["y"]=value
    c1["drilldown"]=key
      
    ar.append(c1)
end
p ar

File.open('./data/task1.json', 'w') do |f|
    
        
        f.puts ar.to_json

  end