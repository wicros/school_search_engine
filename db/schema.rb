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

ActiveRecord::Schema.define(version: 20180823080021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "prefecture_id"
    t.integer "code"
    t.string "name_eng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "college_sandboxes", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.string "total_name"
    t.string "prefecture_name"
    t.decimal "heat"
    t.decimal "difficulty"
    t.decimal "acceptance_rate"
  end

  create_table "college_scores", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.decimal "average"
    t.decimal "median"
    t.integer "highest"
    t.integer "lowest"
    t.integer "sample_size"
    t.index ["name", "department"], name: "index_college_scores_on_name_and_department"
    t.index ["name"], name: "index_college_scores_on_name"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.bigint "user_id"
    t.integer "location_score", default: 0
    t.integer "environment_score", default: 0
    t.integer "service_score", default: 0
    t.integer "progression_score", default: 0
    t.integer "teaching_score", default: 0
    t.integer "fee_score", default: 0
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer "school_id"
    t.string "name"
    t.string "purpose"
    t.string "length"
    t.integer "hours"
    t.integer "weeks"
    t.string "admission"
    t.integer "selection_fee"
    t.integer "admission_fee"
    t.integer "tuition"
    t.integer "other_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission"], name: "index_courses_on_admission"
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "eju_results", force: :cascade do |t|
    t.integer "school_id"
    t.integer "exam_type"
    t.date "date"
    t.integer "examinees"
    t.integer "certified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_eju_results_on_date"
    t.index ["school_id"], name: "index_eju_results_on_school_id"
  end

  create_table "graduate_results", force: :cascade do |t|
    t.integer "school_id"
    t.date "date"
    t.integer "graduate_school"
    t.integer "university"
    t.integer "junior_college"
    t.integer "technical_school"
    t.integer "special_training"
    t.integer "traning_school"
    t.integer "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "graduate_num"
    t.index ["date"], name: "index_graduate_results_on_date"
    t.index ["school_id"], name: "index_graduate_results_on_school_id"
  end

  create_table "jpstudyexpress_public_subjects", id: false, force: :cascade do |t|
    t.text "c1"
    t.text "c2"
    t.text "c3"
    t.text "c4"
    t.text "c5"
    t.text "c6"
    t.text "c7"
  end

  create_table "jpt_levels", force: :cascade do |t|
    t.string "name"
  end

  create_table "jpt_results", force: :cascade do |t|
    t.integer "school_id"
    t.string "level"
    t.date "date"
    t.integer "examinees"
    t.integer "certified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_jpt_results_on_date"
    t.index ["school_id"], name: "index_jpt_results_on_school_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.string "name_eng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.integer "school_id"
    t.string "name"
    t.string "zip_code"
    t.string "address"
    t.string "fax"
    t.string "tel"
    t.string "home_page"
    t.string "email"
    t.text "direction"
    t.string "representative"
    t.string "establisher"
    t.string "principal"
    t.date "start_date"
    t.date "validity_date_start"
    t.date "validity_date_end"
    t.integer "teacher_mun"
    t.integer "capacity"
    t.integer "accommodation"
    t.string "admission"
    t.string "selection"
    t.decimal "latitude", precision: 16, scale: 14
    t.decimal "longitude", precision: 17, scale: 14
    t.string "img_url"
    t.text "description"
    t.integer "prefecture_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_url_file_name"
    t.string "img_url_content_type"
    t.integer "img_url_file_size"
    t.datetime "img_url_updated_at"
    t.index ["school_id"], name: "index_schools_on_school_id"
  end

  create_table "student_froms", force: :cascade do |t|
    t.integer "school_id"
    t.string "from"
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["num"], name: "index_student_froms_on_num"
    t.index ["school_id"], name: "index_student_froms_on_school_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "university_departments", force: :cascade do |t|
    t.string "name"
  end

  create_table "university_names", force: :cascade do |t|
    t.string "name"
  end

  create_table "university_scores", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.string "total_name"
    t.string "prefecture_name"
    t.decimal "heat"
    t.decimal "difficulty"
    t.decimal "acceptance_rate"
    t.decimal "average"
    t.decimal "median"
    t.decimal "highest"
    t.decimal "lowest"
    t.integer "sample_size"
    t.integer "university_id"
    t.integer "department_id"
    t.integer "prefecture_id"
    t.date "date"
    t.index ["department_id"], name: "index_university_scores_on_department_id"
    t.index ["prefecture_id"], name: "index_university_scores_on_prefecture_id"
    t.index ["university_id"], name: "index_university_scores_on_university_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
