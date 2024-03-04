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

ActiveRecord::Schema[7.1].define(version: 2024_03_04_084119) do
  create_table "attendance_logs", force: :cascade do |t|
    t.string "dim"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "attendance_session_id", null: false
    t.index ["attendance_session_id"], name: "index_attendance_logs_on_attendance_session_id"
  end

  create_table "attendance_sessions", force: :cascade do |t|
    t.string "name"
    t.string "begin"
    t.string "end"
    t.date "date"
    t.string "summary"
    t.string "room"
    t.integer "course"
    t.integer "total_attend"
    t.integer "total_not_attend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pegawai_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "user_id"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendance_logs", "attendance_sessions"
end
