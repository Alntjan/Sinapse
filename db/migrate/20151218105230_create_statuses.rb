class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :title
      t.text :description
      t.references :project
      t.references :user
      t.timestamps null: false
    end
  end
end
