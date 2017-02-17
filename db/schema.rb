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

ActiveRecord::Schema.define(version: 20170217040421) do

  create_table "channel_schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "channel"
    t.integer  "program_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_channel_schedules_on_program_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "channel_schedule_id"
    t.text     "text",                limit: 65535
    t.datetime "posted_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["channel_schedule_id"], name: "index_comments_on_channel_schedule_id", using: :btree
  end

  create_table "programs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "series_id"
    t.string   "title"
    t.text     "content",    limit: 65535
    t.text     "highlight",  limit: 65535
    t.integer  "long"
    t.string   "casts"
    t.string   "crews"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["series_id"], name: "index_programs_on_series_id", using: :btree
  end

  create_table "series", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "content",    limit: 65535
    t.text     "highlight",  limit: 65535
    t.string   "casts"
    t.string   "crews"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
