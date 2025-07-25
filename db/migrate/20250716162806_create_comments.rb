class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.string :commenter_name
      t.text :details
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateProjectLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :project_logs do |t|
      t.references :project, null: false, foreign_key: true
      t.string :action, null: false
      t.string :field
      t.string :from_value
      t.string :to_value
      t.timestamps
    end
    add_index :project_logs, :project_id
    add_index :project_logs, :action
  end
end
