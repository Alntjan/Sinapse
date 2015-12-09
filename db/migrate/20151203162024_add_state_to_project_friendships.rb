class AddStateToProjectFriendships < ActiveRecord::Migration
  def change
    add_column :project_friendships, :state, :string
    add_index :project_friendships, :state
  end
end
