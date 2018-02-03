namespace :anchor_groups do
  desc "load labels to anchor_groups from named.csv"
  task load_labels: :environment do
    require 'csv'
    csv = Rails.root.join 'lib', 'seeds', 'named.csv'
    last_group_name = ''
    count = 0
    CSV.foreach(csv, headers: true) do |row|
      next if last_group_name == row['anchor_group']
      ag = AnchorGroup.find_by(old_name: row['anchor_group'])
      next if ag.blank?
      ag.iso3 = row['label'].last(3)
      ag.label = row['label']
      ag.sublabel = row['sublabel']
      if ag.save
        count += 1
        last_group_name = row['anchor_group']
      end
    end
    puts "load #{count} labels to anchor groups."
  end

  desc "reset counters"
  task reset_counters: :environment do
    AnchorGroup.pluck(:id).each do |i|
      AnchorGroup.reset_counters(i, :anchors)
    end
  end

  desc "set all anchor group's label to closest anchor's label"
  task set_label_to_closest_anchor_label: :environment do
    count = 0
    AnchorGroup.all.includes(:anchors).each do |ag|
      closest = ag.closest_anchor
      ag.label = closest.label
      ag.sublabel = closest.sublabel
      ag.iso3 = closest.iso3
      count += 1 if ag.save
    end
    puts "set #{count} anchor groups's labels as closest anchor's label."
  end
end
