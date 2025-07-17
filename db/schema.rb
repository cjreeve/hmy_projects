# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_17_145951) do
  create_table "comments", force: :cascade do |t|
    t.string "commenter_name"
    t.text "details"
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_comments_on_project_id"
  end

  create_table "project_logs", force: :cascade do |t|
    t.integer "project_id", null: false
    t.string "action", null: false
    t.string "field"
    t.string "from_value"
    t.string "to_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action"], name: "index_project_logs_on_action"
    t.index ["project_id"], name: "index_project_logs_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "manager_name", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_name"], name: "index_projects_on_manager_name"
    t.index ["state"], name: "index_projects_on_state"
    t.index ["title"], name: "index_projects_on_title"
  end

  add_foreign_key "comments", "projects"
  add_foreign_key "project_logs", "projects"
end
