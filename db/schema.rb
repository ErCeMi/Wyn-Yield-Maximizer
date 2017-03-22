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

ActiveRecord::Schema.define(version: 20170309220904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blazer_audits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "query_id"
    t.text     "statement"
    t.string   "data_source"
    t.datetime "created_at"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "query_id"
    t.string   "state"
    t.string   "schedule"
    t.text     "emails"
    t.string   "check_type"
    t.text     "message"
    t.datetime "last_run_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.integer  "dashboard_id"
    t.integer  "query_id"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.integer  "creator_id"
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.text     "description"
    t.text     "statement"
    t.string   "data_source"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.integer  "company_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["company_id"], name: "index_employees_on_company_id", using: :btree
  end

  create_table "properties", force: :cascade do |t|
    t.string   "lol3"
    t.string   "unit"
    t.string   "group"
    t.string   "tenantid"
    t.string   "resident_name"
    t.integer  "resident_rent"
    t.integer  "unit_rent"
    t.string   "status"
    t.integer  "days_vacant"
    t.date     "move_in"
    t.date     "move_out"
    t.date     "lease_from"
    t.date     "lease_to"
    t.string   "amenities"
    t.integer  "company_id"
    t.integer  "unit_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["company_id"], name: "index_properties_on_company_id", using: :btree
    t.index ["unit_type_id"], name: "index_properties_on_unit_type_id", using: :btree
  end

  create_table "property_names", force: :cascade do |t|
    t.string   "lol1"
    t.string   "name"
    t.string   "lease_terms"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "unit_types", force: :cascade do |t|
    t.string   "lol2"
    t.string   "unit_type"
    t.string   "bedroom"
    t.integer  "amount_off"
    t.float    "percentage_off"
    t.float    "growth_rate"
    t.integer  "property_name_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["property_name_id"], name: "index_unit_types_on_property_name_id", using: :btree
  end

  add_foreign_key "employees", "companies"
  add_foreign_key "properties", "companies"
  add_foreign_key "properties", "unit_types"
  add_foreign_key "unit_types", "property_names"
end
