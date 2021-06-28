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

ActiveRecord::Schema.define(version: 2021_06_27_151226) do

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.integer "distance", default: 0, null: false
    t.integer "velocity", default: 0, null: false
    t.integer "normal_heartbeat", null: false
    t.integer "max_heartbeat", null: false
    t.integer "maximal_oxygen_consumption", null: false
    t.integer "lactate_threshold", null: false
    t.integer "body_weight", null: false
    t.date "posted_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "encrypted_password", null: false
    t.integer "age", null: false
    t.integer "normal_heartbeat", null: false
    t.integer "max_heartbeat", null: false
    t.integer "maximal_oxygen_consumption", null: false
    t.integer "lactate_threshold", null: false
    t.integer "sex", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "body_weight", default: 0, null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "posts", "users"
end
