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

ActiveRecord::Schema.define(version: 20180201153857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anchor_groups", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.float "elevation"
    t.string "what_3_words"
    t.string "old_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["elevation"], name: "index_anchor_groups_on_elevation"
    t.index ["latitude"], name: "index_anchor_groups_on_latitude"
    t.index ["longitude"], name: "index_anchor_groups_on_longitude"
    t.index ["old_name"], name: "index_anchor_groups_on_old_name"
    t.index ["what_3_words"], name: "index_anchor_groups_on_what_3_words"
  end

  create_table "anchors", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.float "elevation"
    t.string "what_3_words"
    t.bigint "anchor_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anchor_group_id"], name: "index_anchors_on_anchor_group_id"
    t.index ["elevation"], name: "index_anchors_on_elevation"
    t.index ["latitude"], name: "index_anchors_on_latitude"
    t.index ["longitude"], name: "index_anchors_on_longitude"
    t.index ["what_3_words"], name: "index_anchors_on_what_3_words"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "anchors", "anchor_groups"
end
