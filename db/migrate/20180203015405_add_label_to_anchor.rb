class AddLabelToAnchor < ActiveRecord::Migration[5.1]
  def change
    add_column :anchors, :label, :string
    add_index :anchors, :label
    add_column :anchors, :sublabel, :string
    add_index :anchors, :sublabel
    add_column :anchors, :iso3, :string
    add_index :anchors, :iso3

    add_column :anchor_groups, :label, :string
    add_index :anchor_groups, :label
    add_column :anchor_groups, :sublabel, :string
    add_index :anchor_groups, :sublabel
    add_column :anchor_groups, :iso3, :string
    add_index :anchor_groups, :iso3

    add_column :anchor_groups, :anchors_count, :integer, default: 0
    add_index :anchor_groups, :anchors_count
  end
end
