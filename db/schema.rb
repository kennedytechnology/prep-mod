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

ActiveRecord::Schema.define(version: 2020_04_20_095604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "clinic_age_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clinic_age_groups_clinics", id: false, force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "clinic_age_group_id", null: false
  end

  create_table "clinic_services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clinic_services_clinics", id: false, force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "clinic_service_id", null: false
  end

  create_table "clinic_staffs", force: :cascade do |t|
    t.integer "clinic_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clinic_vaccines", force: :cascade do |t|
    t.integer "clinic_id"
    t.integer "vaccine_id"
    t.string "vaccine_log_number"
    t.integer "number_of_doses"
    t.text "comments_incidents"
    t.integer "doses_administered"
    t.integer "doses_unused"
    t.integer "doses_returned"
    t.boolean "is_default"
    t.string "vaccine_manufacturer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clinics", force: :cascade do |t|
    t.date "clinic_date"
    t.integer "venue_id"
    t.string "lead_vaccinator_name"
    t.integer "students_registered"
    t.string "clinic_status"
    t.integer "user_id"
    t.text "outcome_comments"
    t.text "incidents_comments"
    t.string "start_time"
    t.string "end_time"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "clinics_users", id: false, force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "insurance_types", force: :cascade do |t|
    t.string "name"
    t.integer "sort_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "named_places", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "news_signups", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.integer "clinic_id"
    t.integer "student_id"
    t.string "vaccination_status"
    t.integer "clinic_vaccine_id"
    t.integer "user_id"
    t.integer "clinic_staff_id"
    t.string "reaction_type"
    t.integer "downloaded_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state"
    t.string "county"
    t.string "city"
    t.integer "zip_code"
    t.string "first_name"
    t.string "last_name"
    t.string "mothers_maiden_name"
    t.string "address"
    t.string "email"
    t.string "email_confirmation"
    t.date "date_of_birth"
    t.string "sex"
    t.string "phone_number"
    t.date "insured_date_of_birth"
    t.string "relation_to_patient_for_insurance"
    t.string "insurance_type"
    t.string "member_id_for_insurance"
    t.string "card_number_for_insurance"
    t.string "insurance_company_name"
    t.string "group_number_for_insurance"
    t.boolean "has_fever_over"
    t.boolean "has_caugh"
    t.boolean "has_difficult_breathing"
    t.boolean "had_contact_with_confirmed_case"
    t.boolean "is_age_60_or_more"
    t.boolean "had_traveled_to_affected_place"
    t.boolean "has_risk_factor"
    t.string "consent_signature"
    t.string "relation_to_patient_for_consent"
    t.string "consent_date"
    t.string "school"
    t.string "access_code"
    t.boolean "notify_via_sms"
    t.boolean "notify_via_email"
    t.string "middle_initial"
    t.string "age"
    t.string "insured_name"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.integer "named_place_id"
    t.string "name"
    t.string "venue_category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
