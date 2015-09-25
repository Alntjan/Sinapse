class AddLinkToProjectEntries < ActiveRecord::Migration
  def change
    add_column :project_entries, :link, :string
  end
end
