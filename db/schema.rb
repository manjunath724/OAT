# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_11_073723) do

  create_table "answers", force: :cascade do |t|
    t.text "answer"
    t.float "obtained_score", default: 0.0
    t.integer "question_id", null: false
    t.integer "booklet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booklet_id"], name: "index_answers_on_booklet_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "booklets", force: :cascade do |t|
    t.integer "candidate_id", null: false
    t.integer "questionnaire_id", null: false
    t.string "status", default: "Issued"
    t.integer "rating", default: 0
    t.string "remarks"
    t.text "candidate_feedback"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_booklets_on_candidate_id"
    t.index ["questionnaire_id"], name: "index_booklets_on_questionnaire_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questionnaires_questions", id: false, force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "questionnaire_id", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.integer "allotted_score", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "type", default: "Employer", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "booklets"
  add_foreign_key "answers", "questions"
  add_foreign_key "booklets", "questionnaires"
  add_foreign_key "booklets", "users", column: "candidate_id"
end
