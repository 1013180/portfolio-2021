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

ActiveRecord::Schema.define(version: 2021_03_20_102545) do

  create_table "after_images", force: :cascade do |t|
    t.string "after_image_id"
    t.integer "shoe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shoe_id"
    t.text "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shoe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "content"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoe_brands", force: :cascade do |t|
    t.string "brand_name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoe_images", force: :cascade do |t|
    t.integer "shoe_id"
    t.string "before_image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoe_sizes", force: :cascade do |t|
    t.text "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shoe_size_id", null: false
    t.integer "shoe_brand_id", null: false
    t.integer "tag_id"
    t.integer "comment_id"
    t.integer "favorite_id"
    t.text "description"
    t.string "shoe_model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text "introduction"
    t.string "profile_image_id"
    t.string "name", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
