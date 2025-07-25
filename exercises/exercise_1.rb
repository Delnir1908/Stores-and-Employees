require_relative '../setup'

puts "Exercise 1"
puts "----------"

#create_table  =stores do |t|
#  t.column  =name,  =string
#  t.column  =annual_revenue,  =integer
#  t.column  =mens_apparel,  =boolean
#  t.column  =womens_apparel,  =boolean
#  t.timestamps null = false
#end



#1. Use Active Record's `create` class method multiple times to create 3 stores in the database =

#- Burnaby (annual_revenue of 300000, carries men's and women's apparel)
#- Richmond (annual_revenue of 1260000 carries women's apparel only)
#- Gastown (annual_revenue of 190000 carries men's apparel only)

#2. Output (`puts`) the number of the stores using ActiveRecord's `count` method, to ensure that there are three stores in the database.


# Your code goes below here ...


Store.create do |s|
  s.name = 'Burnaby'
  s.annual_revenue = 300000
  s.mens_apparel = true
  s.womens_apparel = true
end

Store.create do |s|
  s.name = 'Richmond'
  s.annual_revenue = 1260000
  s.mens_apparel = false
  s.womens_apparel = true
end

Store.create do |s|
  s.name = 'Gastown'
  s.annual_revenue = 190000
  s.mens_apparel = true
  s.womens_apparel = false
end

puts Store.count
