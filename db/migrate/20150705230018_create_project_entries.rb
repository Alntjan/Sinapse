class CreateProjectEntries < ActiveRecord::Migration
  def change
    create_table :project_entries do |t|
      t.string :name
      t.string :description
      t.references :project
      t.references :user
      t.timestamps null: false
    end
  end
end
