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

ActiveRecord::Schema.define(version: 20151202105042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favs", ["post_id"], name: "index_favs_on_post_id", using: :btree
  add_index "favs", ["user_id"], name: "index_favs_on_user_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "introduction"
    t.text     "content"
    t.date     "date"
    t.text     "synopsis"
    t.string   "status"
    t.string   "category"
    t.integer  "character_number"
    t.string   "city"
    t.float    "price"
    t.string   "licence"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "cover"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "price_cents",      default: 0,     null: false
    t.string   "price_currency",   default: "EUR", null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.text     "description"
    t.string   "photo"
    t.integer  "post_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "uploads", ["post_id"], name: "index_uploads_on_post_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "address"
    t.string   "phone_number"
    t.boolean  "availability"
    t.string   "speciality"
    t.text     "biography"
    t.string   "siren"
    t.string   "document_identity"
    t.string   "company_name"
    t.string   "website_url"
    t.string   "sociallink1"
    t.string   "sociallink2"
    t.string   "sociallink3"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "profile"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "favs", "posts"
  add_foreign_key "favs", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "uploads", "posts"
end
