class CreateInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :infos do |t|
      t.string :name
      t.integer :port_type
      t.integer :fishable
      t.integer :hardwares
      t.text :desc
      t.string :img_url
      t.references :user, foreign_key: true
      t.references :anchor_group, foreign_key: true

      t.timestamps
    end
    add_index :infos, :name
    add_index :infos, :port_type
    add_index :infos, :fishable
    add_index :infos, :hardwares
    add_column :users, :infos_count, :integer, default: 0
    add_index :users, :infos_count
    add_column :anchor_groups, :infos_count, :integer, default: 0
    add_index :anchor_groups, :infos_count
  end
end
