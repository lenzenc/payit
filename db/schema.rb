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

ActiveRecord::Schema.define(version: 20151026151102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 100,                null: false
    t.string   "domain",     limit: 100,                null: false
    t.boolean  "is_active",              default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "customers", ["domain"], name: "IDX_UNQ_CUSTOMER_DOMAIN", unique: true, using: :btree
  add_index "customers", ["name"], name: "IDX_UNQ_CUSTOMER_NAME", unique: true, using: :btree

  create_table "permission_groups", force: :cascade do |t|
    t.string "code", limit: 20,  null: false
    t.string "name", limit: 100, null: false
  end

  add_index "permission_groups", ["code"], name: "IDX_UNQ_PERM_GRP_CODE", unique: true, using: :btree
  add_index "permission_groups", ["name"], name: "IDX_UNQ_PERM_GRP_NAME", unique: true, using: :btree

  create_table "permissions", force: :cascade do |t|
    t.string  "code",                limit: 20,  null: false
    t.string  "name",                limit: 100, null: false
    t.integer "permission_group_id",             null: false
  end

  add_index "permissions", ["code"], name: "IDX_UNQ_PERM_CODE", unique: true, using: :btree
  add_index "permissions", ["name"], name: "IDX_UNQ_PERM_NAME", unique: true, using: :btree

  create_table "permissions_roles", id: false, force: :cascade do |t|
    t.integer "role_id",       null: false
    t.integer "permission_id", null: false
  end

  add_index "permissions_roles", ["role_id", "permission_id"], name: "IDX_UNIQ_ROLE_PERM", unique: true, using: :btree

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  add_index "roles", ["name"], name: "IDX_UNQ_ROLE_NAME", unique: true, using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 100,                null: false
    t.string   "email",                  limit: 255,                null: false
    t.string   "encrypted_password",     limit: 255,                null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",                    default: 0,    null: false
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 100,                null: false
    t.string   "last_name",              limit: 100,                null: false
    t.string   "employee_id",            limit: 100
    t.boolean  "is_active",                          default: true, null: false
    t.integer  "customer_id",                                       null: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
