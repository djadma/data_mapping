# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

mapping_data = [];
role_data = [];
CSV.foreach("#{Rails.root}/public/Data.csv", :headers => true) do |row|
  mapping_data << [row["Mapping"]]
  role_data << [row["Role"]]
end
Mapping.import [:title], mapping_data.uniq
Role.import [:name], role_data.uniq

question_data = [];
role_hash = {}
map_hash = {}
Role.all.map{|role| role_hash[role.name] = role.id }
Mapping.all.map{|map| map_hash[map.title] = map.id }
CSV.foreach("#{Rails.root}/public/Data.csv", :headers => true) do |row|
  question_data << [row["Question"], role_hash[row["Role"]], map_hash[row["Mapping"]]]
end

Question.import [:title, :role_id, :mapping_id], question_data