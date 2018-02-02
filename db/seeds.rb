# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

anchor_group_counts = 0
csv1 = Rails.root.join 'lib', 'seeds', 'represent_anchors.csv'
CSV.foreach(csv1, headers: true) do |row|
  ag = AnchorGroup.new
  ag.latitude = row['lat']
  ag.longitude = row['lng']
  ag.old_name  = row['group']
  ag.what_3_words = row['what_3_words']
  ag.elevation = row['elevation']
  anchor_group_counts += 1 if ag.save
end
puts "Create #{anchor_group_counts} anchor_groups from #{csv1}"

anchor_counts = 0
csv2 = Rails.root.join 'lib', 'seeds', 'unnamed.csv'
CSV.foreach(csv2, headers: true) do |row|
  a = Anchor.new
  a.latitude = row['lat'].to_f
  a.longitude = row['lon'].to_f
  a.anchor_group = AnchorGroup.find_or_create_by!(old_name: row['anchor_group'])
  anchor_counts += 1 if a.save
end
puts "Create #{anchor_counts} anchor_groups from #{csv2}"
