require 'csv'
require 'json'
rcb_batsman_scores = {}

table = CSV.parse(File.read('./data/deliveries.csv'), headers: true)

rcb_batsman_scores = Hash.new(0)
table.each do |row|
  next unless row[2] == 'Royal Challengers Bangalore'

  rcb_batsman_scores[row[6]] += row[15].to_i
end
# puts RCB_batsman_scores

# sorting data in decreasing order
# storing top scorers saperately
Top_ten = rcb_batsman_scores.sort_by { |_key, value| value }.reverse[0..8].to_h

short_name = Array['Kohli', 'Gayle', 'ABD', 'Kallis', 'Dravid', 'Dilshan', 'Uthappa', 'Taylor', 'Tivari']

labels = {}
runs = Array[] # contains runs score by top batsman
Top_ten.each do |_key, value|
  runs.append(value)
end

# creating labels for graph

short_name.each_with_index { |name, idx| labels[idx] = name }

my_data={}
Top_ten.each_with_index do |(key,value), index|
    my_data[short_name[index]]=value   
end    

rcb_batsman_obj=[]
#c1={}
my_data.each do |key,value|
    c1={}
    c1["name"]=key
    c1["y"]=value
    c1["drilldown"]=key
      
    rcb_batsman_obj.append(c1)
end

File.open('./data/task2.json', 'w') do |f|
    
        
        f.puts rcb_batsman_obj.to_json

  end