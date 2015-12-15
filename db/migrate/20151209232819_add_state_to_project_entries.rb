class AddStateToProjectEntries < ActiveRecord::Migration
  def change
    add_column :project_entries, :state, :string
    add_index :project_entries, :state
  end
end
