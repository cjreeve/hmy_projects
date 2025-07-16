class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description
      t.string :manager_name, null: false
      t.string :state, null: false

      t.timestamps
    end
    add_index :projects, :title
    add_index :projects, :manager_name
    add_index :projects, :state
  end
end
