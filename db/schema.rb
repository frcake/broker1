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

ActiveRecord::Schema.define(version: 20160908151507) do

  create_table "categories", force: :cascade do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "lft",                        null: false
    t.integer "rgt",                        null: false
    t.integer "depth",          default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.index ["lft"], name: "index_categories_on_lft"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["rgt"], name: "index_categories_on_rgt"
  end

  create_table "classifieds", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.string   "year"
    t.string   "color"
    t.string   "title"
    t.string   "condition"
    t.string   "price"
    t.string   "offer"
    t.string   "make_country"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_classifieds_on_category_id"
    t.index ["user_id"], name: "index_classifieds_on_user_id"
  end

  create_table "favorite_classifieds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "classified_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["classified_id"], name: "index_favorite_classifieds_on_classified_id"
    t.index ["user_id"], name: "index_favorite_classifieds_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "classified_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["classified_id"], name: "index_photos_on_classified_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email",                  default: "", null: false
    t.string   "region"
    t.string   "telephone"
    t.string   "stars"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
