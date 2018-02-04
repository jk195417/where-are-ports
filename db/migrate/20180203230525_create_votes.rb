class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :info, foreign_key: true

      t.timestamps
    end
    
    add_column :users, :votes_count, :integer, default: 0
    add_index :users, :votes_count
    add_column :infos, :votes_count, :integer, default: 0
    add_index :infos, :votes_count

    add_index :votes, %i[user_id info_id], unique: true
  end
end
