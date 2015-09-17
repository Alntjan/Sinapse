class TypeOnProjectEntries < ActiveRecord::Migration
  def change
    add_column :project_entries, :type, :string
  end
end
