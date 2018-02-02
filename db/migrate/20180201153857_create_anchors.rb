class CreateAnchors < ActiveRecord::Migration[5.1]
  def change
    create_table :anchor_groups do |t|
      t.float :latitude
      t.float :longitude
      t.float :elevation
      t.string :what_3_words
      t.string :old_name
      t.timestamps
    end
    add_index :anchor_groups, :latitude
    add_index :anchor_groups, :longitude
    add_index :anchor_groups, :elevation
    add_index :anchor_groups, :what_3_words
    add_index :anchor_groups, :old_name

    create_table :anchors do |t|
      t.float :latitude
      t.float :longitude
      t.float :elevation
      t.string :what_3_words
      t.references :anchor_group, foreign_key: true
      t.timestamps
    end
    add_index :anchors, :latitude
    add_index :anchors, :longitude
    add_index :anchors, :elevation
    add_index :anchors, :what_3_words
  end
end
