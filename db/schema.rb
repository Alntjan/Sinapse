# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151215120713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "project_entries", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "type"
    t.string   "link"
    t.string   "state"
  end

  add_index "project_entries", ["state"], name: "index_project_entries_on_state", using: :btree

  create_table "project_friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "state"
  end

  add_index "project_friendships", ["state"], name: "index_project_friendships_on_state", using: :btree
  add_index "project_friendships", ["user_id", "project_id"], name: "index_project_friendships_on_user_id_and_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "about"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.string   "state"
    t.boolean  "seeks_ideas"
    t.boolean  "seeks_resources"
    t.boolean  "seeks_appliances"
  end

  add_index "projects", ["seeks_appliances"], name: "index_projects_on_seeks_appliances", using: :btree
  add_index "projects", ["seeks_ideas"], name: "index_projects_on_seeks_ideas", using: :btree
  add_index "projects", ["seeks_resources"], name: "index_projects_on_seeks_resources", using: :btree
  add_index "projects", ["state"], name: "index_projects_on_state", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "age"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_foreign_key "projects", "users"
end
