class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :about
      t.timestamps null: false
    end
  end
end
