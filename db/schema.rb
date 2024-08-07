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

ActiveRecord::Schema.define(version: 2020_08_19_103002) do

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

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "roles_mask"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "appointment_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "queue_state"
    t.boolean "on_waiting_list"
    t.datetime "reminder_sent_at"
    t.index ["clinic_id"], name: "index_appointments_on_clinic_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
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

  create_table "clinic_age_groups_provider_enrollments", id: false, force: :cascade do |t|
    t.bigint "clinic_age_group_id", null: false
    t.bigint "provider_enrollment_id", null: false
  end

  create_table "clinic_events", force: :cascade do |t|
    t.integer "clinic_id"
    t.integer "patient_id"
    t.integer "clinic_staff_id"
    t.string "category"
    t.string "outcome"
    t.integer "inventory_item_id"
    t.string "inventory_item_name"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "contact_type"
    t.string "test_name"
    t.string "test_type"
    t.string "test_processing"
    t.boolean "safety_kit_received"
    t.date "event_date"
    t.string "location"
    t.boolean "is_refused"
    t.boolean "is_sick"
    t.boolean "is_absent"
    t.string "vaccine_route"
    t.string "vaccine_site"
    t.string "vaccine_reaction"
  end

  create_table "clinic_events_services", id: false, force: :cascade do |t|
    t.bigint "clinic_event_id", null: false
    t.bigint "clinic_service_id", null: false
  end

  create_table "clinic_primary_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clinic_primary_groups_clinics", id: false, force: :cascade do |t|
    t.bigint "clinic_primary_group_id", null: false
    t.bigint "clinic_id", null: false
  end

  create_table "clinic_primary_groups_provider_enrollments", id: false, force: :cascade do |t|
    t.bigint "clinic_primary_group_id", null: false
    t.bigint "provider_enrollment_id", null: false
  end

  create_table "clinic_services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
  end

  create_table "clinic_services_clinics", id: false, force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "clinic_service_id", null: false
  end

  create_table "clinic_services_provider_enrollments", id: false, force: :cascade do |t|
    t.bigint "provider_enrollment_id", null: false
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
    t.string "lead_vaccinator_name"
    t.string "clinic_status"
    t.text "outcome_comments"
    t.text "incidents_comments"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "county"
    t.string "zip"
    t.string "city"
    t.string "state"
    t.string "contact_person"
    t.string "contact_phone_number"
    t.string "backup_contact_person"
    t.string "backup_contact_phone_number"
    t.string "appointment_frequency_minutes"
    t.string "appointment_slots"
    t.string "appointments_available"
    t.time "start_time"
    t.time "end_time"
    t.string "venue_name"
    t.time "start_hour_minute"
    t.time "end_hour_minute"
    t.string "location"
    t.integer "provider_enrollment_id"
    t.string "public_or_private"
    t.string "venue_type"
    t.string "open_state"
    t.integer "active_queue_patients_count"
    t.integer "social_distancing"
    t.string "contact_email"
    t.string "backup_contact_email"
    t.integer "appointments_count"
    t.datetime "canceled_at"
  end

  create_table "clinics_supply_inventories", id: false, force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "supply_inventory_id", null: false
  end

  create_table "clinics_users", id: false, force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "customized_reports", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "county"
    t.boolean "patients_screened"
    t.boolean "patients_tested"
    t.boolean "pending_patients"
    t.boolean "safety_kit"
    t.boolean "gender"
    t.boolean "race"
    t.boolean "zip_code"
    t.boolean "insurance_type"
    t.boolean "age"
    t.boolean "date_of_birth"
    t.boolean "vaccine_name_and_lot_number"
    t.boolean "registration_date"
    t.bigint "user_id"
    t.bigint "clinic_id"
    t.boolean "patients_vaccinated"
    t.boolean "test_type"
    t.boolean "test_result"
    t.boolean "remarks"
  end

  create_table "employers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.string "company_name"
    t.text "company_name_search"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "office_phone"
    t.string "mobile_phone"
    t.string "email"
    t.string "total_employees"
    t.string "total_locations"
    t.string "business_locations"
    t.boolean "screening_info"
    t.boolean "testing_info"
    t.boolean "vacination_info"
    t.boolean "other_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "backup_first_name"
    t.string "backup_last_name"
    t.string "backup_position"
    t.string "backup_company_name"
    t.string "backup_address_1"
    t.string "backup_address_2"
    t.string "backup_city"
    t.string "backup_state"
    t.string "backup_zip_code"
    t.string "backup_office_phone"
    t.string "backup_mobile_phone"
    t.string "backup_email"
    t.string "website"
    t.text "comment"
  end

  create_table "employers_patients", id: false, force: :cascade do |t|
    t.bigint "employer_id", null: false
    t.bigint "patient_id", null: false
  end

  create_table "insurance_types", force: :cascade do |t|
    t.string "name"
    t.integer "sort_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inventory_allocations", force: :cascade do |t|
    t.integer "clinic_id"
    t.integer "supply_inventory_id"
    t.integer "allocated_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.boolean "send_to_all_users"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "named_places", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "news_signups", force: :cascade do |t|
    t.string "first_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "zip_code"
    t.date "date_of_birth"
    t.string "topics"
    t.string "occupation"
    t.string "last_name"
    t.boolean "chronic_health_condition"
    t.string "signatory_first_name"
    t.string "signatory_last_name"
  end

  create_table "patient_family_members", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_initial"
    t.string "last_name"
    t.string "mothers_maiden_name"
    t.string "race"
    t.date "date_of_birth"
    t.string "insurance_company_name"
    t.string "member_id_for_insurance"
    t.string "group_number_for_insurance"
    t.integer "patient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "has_fever_over"
    t.boolean "has_cough"
    t.boolean "has_difficult_breathing"
    t.boolean "had_traveled_to_affected_place"
    t.boolean "had_contact_with_confirmed_case"
    t.boolean "has_risk_factor"
    t.boolean "is_age_60_or_more"
    t.boolean "has_other_reason"
    t.string "has_child_allergies"
    t.string "has_child_serious_reaction_to_vaccine"
    t.string "has_child_immune_system_problem"
    t.string "is_child_pregnant_or_possible_to_become"
    t.string "has_child_been_vaccinated_last_four_weeks"
    t.text "has_other_reason_explanation"
    t.integer "venue_id"
    t.string "county"
  end

  create_table "patient_family_members_vaccine_offerings", id: false, force: :cascade do |t|
    t.bigint "vaccine_offering_id", null: false
    t.bigint "patient_family_member_id", null: false
  end

  create_table "patients", force: :cascade do |t|
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
    t.boolean "has_cough"
    t.boolean "has_difficult_breathing"
    t.boolean "had_contact_with_confirmed_case"
    t.boolean "is_age_60_or_more"
    t.boolean "had_traveled_to_affected_place"
    t.boolean "has_risk_factor"
    t.string "consent_signature"
    t.string "relation_to_patient_for_consent"
    t.string "school"
    t.string "access_code"
    t.boolean "notify_via_sms"
    t.boolean "notify_via_email"
    t.string "middle_initial"
    t.string "age"
    t.boolean "has_other_reason"
    t.text "other_reason_explanation"
    t.date "consent_date"
    t.string "signatory_first_name"
    t.string "signatory_last_name"
    t.string "insured_first_name"
    t.string "insured_last_name"
    t.string "occupation"
    t.string "race"
    t.string "notification_preferences"
    t.string "check_in_code"
    t.text "signature_data"
    t.boolean "sharing_results_authorized"
    t.text "has_other_reason_explanation"
    t.string "grade"
    t.string "homeroom_teacher"
    t.string "guardian_first_name"
    t.string "guardian_last_name"
    t.string "guardian_email"
    t.string "has_child_allergies"
    t.string "has_child_serious_reaction_to_vaccine"
    t.string "has_child_immune_system_problem"
    t.string "is_child_pregnant_or_possible_to_become"
    t.string "has_child_been_vaccinated_last_four_weeks"
    t.bigint "venue_id"
    t.string "signer_first_name"
    t.string "signer_last_name"
    t.index ["venue_id"], name: "index_patients_on_venue_id"
  end

  create_table "patients_vaccine_offerings", id: false, force: :cascade do |t|
    t.bigint "vaccine_offering_id", null: false
    t.bigint "patient_id", null: false
  end

  create_table "provider_denial_messages", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "provider_enrollments", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "practice_fax_number"
    t.string "npi_number"
    t.string "license_number"
    t.string "license_type"
    t.string "medical_specialty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "professional_license"
    t.string "license_state_of_issue"
    t.date "license_date_of_issue"
    t.string "title"
    t.string "practice_name"
    t.string "practice_address"
    t.string "practice_city"
    t.string "practice_state"
    t.integer "practice_zip_code"
    t.string "practice_office_phone"
    t.string "practice_mobile_phone"
    t.string "practice_email"
    t.string "practice_backup_contact"
    t.string "practice_backup_office_phone"
    t.string "practice_backup_email"
    t.string "freezer"
    t.string "high_risk_group_served"
    t.boolean "does_provide_vaccination"
    t.boolean "does_provide_vfc"
    t.string "refrigerator"
    t.string "refrigerator_thermometer"
    t.text "additional_info"
    t.string "middle_initial"
    t.string "practice_type"
    t.string "contact_office_phone"
    t.string "contact_mobile_phone"
    t.string "contact_email"
    t.string "practice_backup_mobile_phone"
    t.string "status"
    t.string "county"
    t.string "unique_number"
  end

  create_table "providers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "practice_fax_number"
    t.string "npi_number"
    t.string "license_number"
    t.string "license_type"
    t.string "medical_specialty"
    t.string "professional_license"
    t.date "license_date_of_issue"
    t.string "title"
    t.string "practice_name"
    t.string "practice_address"
    t.string "practice_city"
    t.string "practice_state"
    t.integer "practice_zip_code"
    t.string "practice_office_phone"
    t.string "practice_mobile_phone"
    t.string "practice_email"
    t.string "practice_backup_contact"
    t.string "practice_backup_office_phone"
    t.string "practice_backup_email"
    t.string "freezer"
    t.string "high_risk_group_served"
    t.boolean "does_provide_vaccination"
    t.boolean "does_provide_vfc"
    t.string "refrigerator"
    t.string "refrigerator_thermometer"
    t.text "additional_info"
    t.string "middle_initial"
    t.string "practice_type"
    t.string "contact_office_phone"
    t.string "contact_mobile_phone"
    t.string "contact_email"
    t.string "practice_backup_mobile_phone"
    t.string "county"
    t.string "unique_number"
    t.string "license_state_of_issue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "supply_inventories", force: :cascade do |t|
    t.date "received_at"
    t.string "item_type"
    t.string "item_name"
    t.string "manufacturer"
    t.string "lot_number"
    t.date "expiration_date"
    t.integer "quantity"
    t.string "packaging"
    t.string "source"
    t.string "product_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "county"
    t.string "venue_name"
    t.bigint "user_id"
    t.string "category"
    t.integer "number_of_items"
    t.index ["user_id"], name: "index_supply_inventories_on_user_id"
  end

  create_table "supply_inventory_events", force: :cascade do |t|
    t.date "event_date"
    t.string "event_type"
    t.integer "quantity_used"
    t.integer "quantity_lost"
    t.integer "quantity_loaned"
    t.integer "quantity_destroyed"
    t.bigint "supply_inventory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity_returned"
    t.integer "clinic_id"
    t.index ["supply_inventory_id"], name: "index_supply_inventory_events_on_supply_inventory_id"
  end

  create_table "test_kits", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.string "test_name"
    t.string "test_manufacturer"
    t.string "test_lot_number"
    t.string "test_type"
    t.string "test_processing"
    t.date "test_expiration_date"
    t.integer "test_kits_quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tests_administered"
    t.integer "unusable_tests"
    t.integer "tests_returned"
    t.boolean "is_default"
    t.index ["clinic_id"], name: "index_test_kits_on_clinic_id"
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
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.integer "roles_mask"
    t.string "first_name"
    t.string "last_name"
    t.string "venues", default: [], array: true
    t.integer "provider_id"
    t.string "email_confirmation"
    t.string "county"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_venues", id: false, force: :cascade do |t|
    t.bigint "venue_id", null: false
    t.bigint "user_id", null: false
    t.index ["user_id", "venue_id"], name: "index_users_venues_on_user_id_and_venue_id"
    t.index ["venue_id", "user_id"], name: "index_users_venues_on_venue_id_and_user_id"
  end

  create_table "vaccine_event_details", force: :cascade do |t|
    t.string "vaccine"
    t.string "route"
    t.string "site"
    t.string "reaction"
    t.integer "clinic_event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vaccine_offerings", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "city"
    t.integer "zip_code"
    t.string "state"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "county"
    t.string "category"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "clinics"
  add_foreign_key "appointments", "patients"
  add_foreign_key "patients", "venues"
  add_foreign_key "providers", "users"
  add_foreign_key "supply_inventories", "users"
  add_foreign_key "supply_inventory_events", "supply_inventories"
  add_foreign_key "test_kits", "clinics"
end
