# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080904015144) do

  create_table "accommodations", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "left"
    t.string   "right"
  end

  create_table "accounts", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fields", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_central"
    t.integer  "status"
    t.string   "yacht_name"
    t.string   "yacht_manufacturer"
    t.string   "yacht_model"
    t.boolean  "is_new"
    t.string   "yacht_description"
    t.integer  "yacht_year"
    t.integer  "yacht_type"
    t.integer  "length"
    t.integer  "lwl"
    t.integer  "loa"
    t.integer  "beam"
    t.integer  "min_draft"
    t.integer  "max_draft"
    t.integer  "bridge_clearance"
    t.integer  "displacement"
    t.integer  "ballast"
    t.integer  "cruise_speed"
    t.integer  "max_speed"
    t.integer  "length_units"
    t.integer  "weight_units"
    t.integer  "speed_units"
    t.integer  "price"
    t.integer  "currency"
    t.string   "city"
    t.integer  "state"
    t.integer  "country"
    t.integer  "hull_material"
    t.string   "designer"
    t.integer  "fuel_tank_capacity"
    t.integer  "water_tank_capacity"
    t.integer  "holding_tank_capacity"
    t.integer  "volume_units"
    t.string   "engine_manufacturer"
    t.string   "engine_model"
    t.integer  "engine_fuel"
    t.integer  "engine_horsepower"
    t.integer  "engine_year"
    t.integer  "engine_hours"
    t.integer  "number_of_engines"
  end

  create_table "multiple_listing_systems", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "pictures", :force => true do |t|
    t.string   "description"
    t.string   "content_type"
    t.string   "filename"
    t.binary   "binary_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
