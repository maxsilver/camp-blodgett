# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131109135835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabins", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "camp_seasons", force: true do |t|
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "camp_sessions", force: true do |t|
    t.integer  "number"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "age_range"
    t.integer  "camp_season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "camp_sessions", ["camp_season_id"], name: "index_camp_sessions_on_camp_season_id", using: :btree

  create_table "camper_discounts", force: true do |t|
    t.integer  "camper_registration_id"
    t.integer  "discount_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "camper_discounts", ["camper_registration_id"], name: "index_camper_discounts_on_camper_registration_id", using: :btree
  add_index "camper_discounts", ["discount_id"], name: "index_camper_discounts_on_discount_id", using: :btree

  create_table "camper_registrations", force: true do |t|
    t.boolean  "new_camper"
    t.string   "how_did_you_hear_about_us"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "gender"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.date     "birth_date"
    t.integer  "age_at_start_of_camp"
    t.integer  "grade_next_year"
    t.string   "school"
    t.string   "adult_shirt_size"
    t.string   "parent_or_guardian_name"
    t.string   "parent_or_guardian_relationship"
    t.string   "parent_or_guardian_home_phone"
    t.string   "parent_or_guardian_cell_phone"
    t.string   "parent_or_guardian_employer"
    t.string   "parent_or_guardian_work_phone"
    t.string   "parent_or_guardian_email"
    t.string   "parent_or_guardian_allow_pickup_name_1"
    t.string   "parent_or_guardian_allow_pickup_phone_1"
    t.string   "parent_or_guardian_allow_pickup_name_2"
    t.string   "parent_or_guardian_allow_pickup_phone_2"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_phone"
    t.string   "emergency_contact_doctor"
    t.string   "emergency_contact_doctor_phone"
    t.string   "health_insurance"
    t.string   "health_insurance_policyholder_name"
    t.string   "health_insurance_policy_number"
    t.string   "health_insurance_group_number"
    t.boolean  "no_health_insurance"
    t.boolean  "hay_fever_asthma_respiratory_conditions"
    t.boolean  "diabetes"
    t.boolean  "eczema_skin_rashes"
    t.boolean  "heart_conditions"
    t.boolean  "bedwetting"
    t.boolean  "colds_sore_throats_earaches"
    t.boolean  "adhd_odd_ocd"
    t.boolean  "convulsions_seizures"
    t.boolean  "shortness_of_breath"
    t.boolean  "aspergers_autism"
    t.text     "other_health_info"
    t.text     "previous_health_history"
    t.boolean  "has_infectious_disease"
    t.text     "has_infectious_disease_explanation"
    t.text     "known_allergies"
    t.boolean  "immunization_up_to_date"
    t.date     "tetanus_booster_shot"
    t.date     "measles_mumps_shot"
    t.date     "polio_shot"
    t.date     "hepatitis_b_shot"
    t.boolean  "parent_has_signed"
    t.string   "camp_check_in_location"
    t.integer  "estimated_camp_fee_cents",                default: 0,     null: false
    t.string   "estimated_camp_fee_currency",             default: "USD", null: false
    t.integer  "deposit_amount_cents",                    default: 0,     null: false
    t.string   "deposit_amount_currency",                 default: "USD", null: false
    t.integer  "balance_due_cents",                       default: 0,     null: false
    t.string   "balance_due_currency",                    default: "USD", null: false
    t.integer  "camp_season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "camper_registrations", ["camp_season_id"], name: "index_camper_registrations_on_camp_season_id", using: :btree

  create_table "camper_sessions", force: true do |t|
    t.integer  "camp_session_id"
    t.integer  "camper_registration_id"
    t.integer  "cabin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "camper_sessions", ["cabin_id"], name: "index_camper_sessions_on_cabin_id", using: :btree
  add_index "camper_sessions", ["camp_session_id"], name: "index_camper_sessions_on_camp_session_id", using: :btree
  add_index "camper_sessions", ["camper_registration_id"], name: "index_camper_sessions_on_camper_registration_id", using: :btree

  create_table "discounts", force: true do |t|
    t.text     "description"
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "USD", null: false
    t.integer  "camp_season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "discounts", ["camp_season_id"], name: "index_discounts_on_camp_season_id", using: :btree

  create_table "medications", force: true do |t|
    t.string   "name"
    t.string   "frequency"
    t.string   "dosage"
    t.integer  "camper_registration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medications", ["camper_registration_id"], name: "index_medications_on_camper_registration_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
