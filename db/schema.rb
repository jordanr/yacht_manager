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

ActiveRecord::Schema.define(:version => 20081214233006) do

  create_table "accommodations", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "left"
    t.text     "right"
    t.integer  "yacht_id"
    t.integer  "order",      :default => 0
  end

  create_table "accounts", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "multiple_listing_system_id"
    t.integer  "user_id"
  end

  create_table "listings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "central"
    t.integer  "status_id",  :default => 2
    t.integer  "yacht_id"
    t.integer  "user_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "city"
    t.integer  "state_id",   :default => 10
    t.integer  "country_id", :default => 232
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multiple_listing_systems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.text     "description"
    t.string   "content_type"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "yacht_id"
    t.integer  "order",        :default => 0
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
  end

  create_table "prices", :force => true do |t|
    t.integer  "currency_id", :default => 1
    t.decimal  "value"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specifications", :force => true do |t|
    t.integer  "picture_id"
    t.integer  "specification_class_id", :default => 2
    t.string   "description"
    t.string   "manufacturer",           :default => "Custom"
    t.string   "model"
    t.integer  "year"
    t.integer  "type_id",                :default => 3
    t.decimal  "length"
    t.decimal  "lwl"
    t.decimal  "loa"
    t.decimal  "beam"
    t.decimal  "min_draft"
    t.decimal  "max_draft"
    t.decimal  "bridge_clearance"
    t.decimal  "displacement"
    t.decimal  "ballast"
    t.decimal  "cruise_speed"
    t.decimal  "max_speed"
    t.integer  "length_units_id",        :default => 1
    t.integer  "weight_units_id",        :default => 3
    t.integer  "speed_units_id",         :default => 1
    t.integer  "volume_units_id",        :default => 1
    t.integer  "hull_material_id",       :default => 3
    t.string   "designer"
    t.decimal  "fuel_tank_capacity"
    t.decimal  "water_tank_capacity"
    t.decimal  "holding_tank_capacity"
    t.string   "engine_manufacturer"
    t.string   "engine_model"
    t.integer  "engine_fuel_id",         :default => 1
    t.decimal  "engine_horsepower"
    t.integer  "engine_year"
    t.integer  "engine_hours"
    t.integer  "number_of_engines",      :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.string   "description"
    t.integer  "listing_id"
    t.integer  "account_id"
    t.integer  "user_id"
    t.integer  "remote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "dirty",       :default => true
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

  create_table "yachts", :force => true do |t|
    t.integer  "specification_id"
    t.string   "name",             :default => "No name"
    t.boolean  "new"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
