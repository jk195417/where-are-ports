namespace :anchors do
  desc "load label to anchors from named.csv"
  task load_labels: :environment do
    require 'csv'
    csv = Rails.root.join 'lib', 'seeds', 'named.csv'
    count = 0
    CSV.foreach(csv, headers: true) do |row|
      a = Anchor.find_by latitude: row['lat'], longitude: row['lon']
      next if a.blank?
      a.iso3 = row['label'].last(3)
      a.label = row['label']
      a.sublabel = row['sublabel']
      count += 1 if a.save
    end
    puts "load #{count} labels to anchors."
  end
end
