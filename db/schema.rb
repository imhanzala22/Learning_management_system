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

ActiveRecord::Schema[7.0].define(version: 2023_01_12_133849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_title"
    t.string "course_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "section_id", null: false
    t.bigint "student_id", null: false
    t.bigint "semester_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "grade_id", default: 1
    t.index ["grade_id"], name: "index_enrollments_on_grade_id"
    t.index ["section_id"], name: "index_enrollments_on_section_id"
    t.index ["semester_id"], name: "index_enrollments_on_semester_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "expertises", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_expertises_on_course_id"
    t.index ["teacher_id"], name: "index_expertises_on_teacher_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string "grade_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "section_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "semester_id"
    t.bigint "teacher_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_sections_on_course_id"
    t.index ["semester_id"], name: "index_sections_on_semester_id"
    t.index ["teacher_id"], name: "index_sections_on_teacher_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.string "semester_type"
    t.integer "semester_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_semesters", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "semester_id"
    t.string "enroll_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semester_id"], name: "index_student_semesters_on_semester_id"
    t.index ["student_id"], name: "index_student_semesters_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "Date_of_Birth"
    t.integer "roll_no"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "Date_of_Birth"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  add_foreign_key "enrollments", "sections"
  add_foreign_key "enrollments", "semesters"
  add_foreign_key "enrollments", "students"
  add_foreign_key "expertises", "courses"
  add_foreign_key "expertises", "teachers"
end
