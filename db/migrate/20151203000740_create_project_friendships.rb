class CreateProjectFriendships < ActiveRecord::Migration
  def change
    create_table :project_friendships do |t|
      t.integer :user_id
      t.integer :project_id
      t.timestamps null: false
    end

    add_index :project_friendships, [:user_id, :project_id]
  end
end
