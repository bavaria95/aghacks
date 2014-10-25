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

ActiveRecord::Schema.define(version: 20141025173054) do

  create_table "applies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_types", force: true do |t|
    t.text     "type"
    t.text     "license"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.text     "creator"
    t.text     "long_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "apply_id"
    t.text     "skills"
  end

  create_table "projects_applies", id: false, force: true do |t|
    t.integer "project_id"
    t.integer "apply_id"
  end

  create_table "projects_skills", id: false, force: true do |t|
    t.integer "project_id"
    t.integer "skill_id"
  end

  create_table "skills", force: true do |t|
    t.string   "skill"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills_users", id: false, force: true do |t|
    t.integer "skill_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",                   default: 2
    t.integer  "project_id"
    t.string   "username"
    t.text     "info"
    t.string   "skills"
    t.boolean  "is_confirmed"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
