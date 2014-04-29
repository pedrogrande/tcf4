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

ActiveRecord::Schema.define(version: 20140429004244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credit_point_packs", force: true do |t|
    t.string   "name"
    t.integer  "number_of_points"
    t.integer  "price"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goal_skills", force: true do |t|
    t.integer  "goal_id"
    t.integer  "skill_id"
    t.integer  "required_skill_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goal_skills", ["goal_id", "skill_id"], name: "index_goal_skills_on_goal_id_and_skill_id", unique: true, using: :btree
  add_index "goal_skills", ["goal_id"], name: "index_goal_skills_on_goal_id", using: :btree
  add_index "goal_skills", ["skill_id"], name: "index_goal_skills_on_skill_id", using: :btree

  create_table "goal_units", force: true do |t|
    t.integer  "unit_id"
    t.integer  "goal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goal_units", ["goal_id", "unit_id"], name: "index_goal_units_on_goal_id_and_unit_id", unique: true, using: :btree
  add_index "goal_units", ["goal_id"], name: "index_goal_units_on_goal_id", using: :btree
  add_index "goal_units", ["unit_id"], name: "index_goal_units_on_unit_id", using: :btree

  create_table "goals", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guest_user_goals", force: true do |t|
    t.integer  "guest_user_id"
    t.integer  "goal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guest_user_goals", ["goal_id"], name: "index_guest_user_goals_on_goal_id", using: :btree
  add_index "guest_user_goals", ["guest_user_id", "goal_id"], name: "index_guest_user_goals_on_guest_user_id_and_goal_id", unique: true, using: :btree
  add_index "guest_user_goals", ["guest_user_id"], name: "index_guest_user_goals_on_guest_user_id", using: :btree

  create_table "guest_user_skills", force: true do |t|
    t.integer  "guest_user_id"
    t.integer  "skill_id"
    t.integer  "skill_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guest_user_skills", ["guest_user_id", "skill_id"], name: "index_guest_user_skills_on_guest_user_id_and_skill_id", unique: true, using: :btree
  add_index "guest_user_skills", ["guest_user_id"], name: "index_guest_user_skills_on_guest_user_id", using: :btree
  add_index "guest_user_skills", ["skill_id"], name: "index_guest_user_skills_on_skill_id", using: :btree

  create_table "guest_users", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "programme_id"
    t.boolean  "enrolled"
    t.boolean  "converted"
  end

  add_index "guest_users", ["user_id"], name: "index_guest_users_on_user_id", using: :btree

  create_table "points_tables", force: true do |t|
    t.integer  "user_id"
    t.integer  "received"
    t.integer  "purchased"
    t.integer  "spent"
    t.integer  "current"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points_tables", ["user_id"], name: "index_points_tables_on_user_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "profile_picture"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "programme_units", force: true do |t|
    t.integer  "programme_id"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "programme_units", ["programme_id", "unit_id"], name: "index_programme_units_on_programme_id_and_unit_id", unique: true, using: :btree
  add_index "programme_units", ["programme_id"], name: "index_programme_units_on_programme_id", using: :btree
  add_index "programme_units", ["unit_id"], name: "index_programme_units_on_unit_id", using: :btree

  create_table "programmes", force: true do |t|
    t.integer  "user_id"
    t.datetime "commenced"
    t.datetime "completed"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "programmes", ["user_id"], name: "index_programmes_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "skill_groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_levels", force: true do |t|
    t.string   "name"
    t.string   "summary"
    t.string   "question"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "icon"
    t.integer  "skill_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["skill_group_id"], name: "index_skills_on_skill_group_id", using: :btree

  create_table "unit_skills", force: true do |t|
    t.integer  "unit_id"
    t.integer  "skill_id"
    t.integer  "before_skill_level"
    t.integer  "after_skill_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unit_skills", ["skill_id"], name: "index_unit_skills_on_skill_id", using: :btree
  add_index "unit_skills", ["unit_id", "skill_id"], name: "index_unit_skills_on_unit_id_and_skill_id", unique: true, using: :btree
  add_index "unit_skills", ["unit_id"], name: "index_unit_skills_on_unit_id", using: :btree

  create_table "units", force: true do |t|
    t.string   "name"
    t.string   "tagline"
    t.text     "description"
    t.integer  "duration_minutes"
    t.string   "icon"
    t.integer  "skill_group_id"
    t.string   "unit_code"
    t.integer  "workshop_credits"
    t.integer  "online_credits"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "units", ["skill_group_id"], name: "index_units_on_skill_group_id", using: :btree

  create_table "user_goals", force: true do |t|
    t.integer  "user_id"
    t.integer  "goal_id"
    t.text     "notes"
    t.boolean  "achieved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_goals", ["goal_id"], name: "index_user_goals_on_goal_id", using: :btree
  add_index "user_goals", ["user_id", "goal_id"], name: "index_user_goals_on_user_id_and_goal_id", unique: true, using: :btree
  add_index "user_goals", ["user_id"], name: "index_user_goals_on_user_id", using: :btree

  create_table "user_skills", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.integer  "skill_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
  add_index "user_skills", ["user_id", "skill_id"], name: "index_user_skills_on_user_id_and_skill_id", unique: true, using: :btree
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id", using: :btree

  create_table "user_units", force: true do |t|
    t.integer  "user_id"
    t.integer  "unit_id"
    t.datetime "commenced"
    t.datetime "completed"
    t.decimal  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_units", ["unit_id"], name: "index_user_units_on_unit_id", using: :btree
  add_index "user_units", ["user_id", "unit_id"], name: "index_user_units_on_user_id_and_unit_id", unique: true, using: :btree
  add_index "user_units", ["user_id"], name: "index_user_units_on_user_id", using: :btree

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
