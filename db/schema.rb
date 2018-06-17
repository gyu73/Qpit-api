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

ActiveRecord::Schema.define(version: 2018_06_07_004534) do

  create_table "hints", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "has_like_person", default: ""
    t.string "belong_to_club", default: ""
    t.string "club", default: ""
    t.string "hair_style", default: ""
    t.string "clothing", default: ""
    t.string "height", default: ""
    t.string "personality", default: ""
    t.string "age", default: ""
    t.string "school", default: ""
    t.string "company", default: ""
    t.string "favorite_phrase", default: ""
    t.string "like_food", default: ""
    t.string "like_music", default: ""
    t.string "hobby", default: ""
    t.string "like_subject", default: ""
    t.string "hate_subject", default: ""
    t.string "has_spoken", default: ""
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secret_hints", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "like_person_initial", default: ""
    t.string "classroom", default: ""
    t.string "familiar", default: ""
    t.string "contact_line", default: ""
    t.string "like_person_nickname", default: ""
    t.string "first_meeting", default: ""
    t.integer "user_id"
    t.integer "hint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "screen_name"
    t.string "name"
    t.string "profile_image_url_https"
    t.string "like_person_screen_name", default: ""
    t.string "like_person_twitter_profile_image", default: ""
    t.time "last_shoot_time", default: "2000-01-01 08:48:30"
    t.integer "stock_arrow", default: 1
    t.integer "coming_arrow_number", default: 0
    t.boolean "login", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
