class AddStateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :state, :string
    add_index :projects, :state
  end
end
