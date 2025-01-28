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

ActiveRecord::Schema[7.2].define(version: 2025_01_26_201504) do
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
    t.integer "sets"
    t.integer "reps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weight"
    t.bigint "workout_id", null: false
    t.index ["exercise_id"], name: "index_gym_lifts_on_exercise_id"
    t.index ["workout_id"], name: "index_gym_lifts_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "username"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.text "parts_hit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "gym_lifts", "exercises"
  add_foreign_key "gym_lifts", "workouts"
end
