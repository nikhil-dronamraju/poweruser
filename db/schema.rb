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

ActiveRecord::Schema[7.2].define(version: 2025_02_07_223806) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.text "title"
    t.text "desc"
    t.text "exercise_type"
    t.text "equipment"
    t.text "level"
    t.text "rating"
    t.text "rating_desc"
    t.text "body_part"
  end

  create_table "gym_lifts", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.integer "sets", default: 1
    t.integer "reps", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weight", default: 1
    t.bigint "workout_id", null: false
    t.index ["exercise_id"], name: "index_gym_lifts_on_exercise_id"
    t.index ["workout_id"], name: "index_gym_lifts_on_workout_id"
  end

  create_table "sagas", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.index ["user_id"], name: "index_sagas_on_user_id"
  end

  create_table "smart_goals", force: :cascade do |t|
    t.bigint "user_track_id", null: false
    t.string "measurable_goal"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_smart_goals_on_user_id"
    t.index ["user_track_id"], name: "index_smart_goals_on_user_track_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_tracks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "track_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_user_tracks_on_track_id"
    t.index ["user_id"], name: "index_user_tracks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name", null: false
    t.text "username", null: false
    t.text "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "workout_streak", default: 0
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.text "parts_hit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "workout_type", default: 0
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "gym_lifts", "exercises"
  add_foreign_key "gym_lifts", "workouts"
  add_foreign_key "sagas", "users"
  add_foreign_key "smart_goals", "user_tracks"
  add_foreign_key "smart_goals", "users"
  add_foreign_key "user_tracks", "tracks"
  add_foreign_key "user_tracks", "users"
  add_foreign_key "workouts", "users"
end
