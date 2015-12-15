class AddLockedProjectEntries < ActiveRecord::Migration
  def change
    add_column :projects, :seeks_ideas, :boolean
    add_column :projects, :seeks_resources, :boolean
    add_column :projects, :seeks_appliances, :boolean

    add_index :projects, :seeks_ideas
    add_index :projects, :seeks_resources
    add_index :projects, :seeks_appliances

  end
end
