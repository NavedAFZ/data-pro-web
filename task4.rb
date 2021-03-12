require 'csv'
require 'json'

table = CSV.parse(File.read('./data/matches.csv'), headers: true)

# SEASONS CONTAIN EVERY YEAR
seasons = Array[]

table.each do |value|
  seasons.append(value[1])
end

# REMOVING DUPLICATES AND SORTING
seasons = seasons.uniq.sort

complete_season_wise_data = {}

teams = []
table.each do |row|
  if row['team1'] != 'Rising Pune Supergiant' && row['team2'] != 'Rising Pune Supergiant'
    teams.append(row['team1']) unless teams.include?(row['team1'])
    teams.append(row['team2']) unless teams.include?(row['team2'])
  end
  complete_season_wise_data[row['season']] = Hash.new(0) unless complete_season_wise_data.key?(row['season'])
  complete_season_wise_data[row['season']][row['team1']] += 1
  complete_season_wise_data[row['season']][row['team2']] += 1
  complete_season_wise_data[row['season']]['Rising Pune Supergiants'] +=
    complete_season_wise_data[row['season']]['Rising Pune Supergiant']
  complete_season_wise_data[row['season']].delete('Rising Pune Supergiant')
end

team_mathes_each_season = {}
teams.each do |team|
  team_mathes_each_season[team] = Array[]
end

a1 = complete_season_wise_data['2017']
complete_season_wise_data.delete('2017')
complete_season_wise_data['2017'] = a1
# creating team and matches played by them each season
complete_season_wise_data.each do |key, _value|
  a1 = complete_season_wise_data[key]
  teams.each do |team|
    if a1.key?(team)
      team_mathes_each_season[team].append(a1[team])
    else
      team_mathes_each_season[team].append(0)
    end
  end
end


short_name = Array['SH', 'RCB', 'GL', 'KKR', 'DD', 'MI', 'K11P', 'CSK', 'RR', 'DC', 'Kochi', 'PW', 'RPS']

# team_mathes_each_season.each_with_index do |(_key, value), idx|
#   g.data(short_name[idx], value)
# end

labels_name = {}
# creating labels for graph
seasons.each_with_index { |name, idx| labels_name[idx] = name }

p team_mathes_each_season
p seasons

my_data={}
team_mathes_each_season.each_with_index do |(key,value), index|
    my_data[short_name[index]]=value   
end    

season_obj=[]
#c1={}
my_data.each do |key,value|
    c1={}
    c1["name"]=key
    c1["data"]=value
      
    season_obj.append(c1)
end

File.open('./data/task4.json', 'w') do |f|
    
        
        f.puts season_obj.to_json

  end