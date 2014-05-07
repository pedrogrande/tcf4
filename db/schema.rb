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

ActiveRecord::Schema.define(version: 20140507125807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_point_packs", force: true do |t|
    t.string   "name"
    t.integer  "number_of_points"
    t.integer  "price"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

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
    t.string   "slug"
  end

  add_index "goals", ["slug"], name: "index_goals_on_slug", unique: true, using: :btree

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

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "building"
    t.string   "street"
    t.string   "suburb"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
    t.string   "map_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
  end

  create_table "payments", force: true do |t|
    t.string   "payment_method"
    t.integer  "payment_price"
    t.integer  "credit_points_purchased"
    t.integer  "user_id"
    t.boolean  "payment_received"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

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

  create_table "points_transactions", force: true do |t|
    t.integer  "user_id"
    t.string   "transaction_type"
    t.integer  "number_of_points"
    t.integer  "value_of_points"
    t.text     "notes"
    t.boolean  "approval_required"
    t.boolean  "approval_received"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points_transactions", ["user_id"], name: "index_points_transactions_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "lead"
    t.text     "content"
    t.string   "image"
    t.string   "publish"
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "profile_picture"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "completion"
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

  create_table "purchases", force: true do |t|
    t.integer  "payment_id"
    t.integer  "user_id"
    t.string   "guid"
    t.integer  "credit_points"
    t.integer  "price"
    t.integer  "credit_point_pack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["credit_point_pack_id"], name: "index_purchases_on_credit_point_pack_id", using: :btree
  add_index "purchases", ["payment_id"], name: "index_purchases_on_payment_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

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
    t.string   "slug"
  end

  add_index "skill_groups", ["slug"], name: "index_skill_groups_on_slug", unique: true, using: :btree

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

  create_table "unit_sessions", force: true do |t|
    t.integer  "unit_id"
    t.string   "day"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "number_of_places"
    t.integer  "number_of_students_registered"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  add_index "unit_sessions", ["location_id"], name: "index_unit_sessions_on_location_id", using: :btree
  add_index "unit_sessions", ["unit_id"], name: "index_unit_sessions_on_unit_id", using: :btree

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
    t.string   "slug"
  end

  add_index "units", ["skill_group_id"], name: "index_units_on_skill_group_id", using: :btree
  add_index "units", ["slug"], name: "index_units_on_slug", unique: true, using: :btree

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

  create_table "user_unit_sessions", force: true do |t|
    t.integer  "unit_id"
    t.integer  "unit_session_id"
    t.boolean  "attended"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_unit_sessions", ["unit_id"], name: "index_user_unit_sessions_on_unit_id", using: :btree
  add_index "user_unit_sessions", ["unit_session_id"], name: "index_user_unit_sessions_on_unit_session_id", using: :btree

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
