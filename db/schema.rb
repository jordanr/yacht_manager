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

ActiveRecord::Schema.define(:version => 20090310182314) do

  create_table "details", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "listing_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order",      :limit => 11
  end

  create_table "listings", :force => true do |t|
    t.integer  "user_id",                          :limit => 11
    t.string   "contact"
    t.integer  "price",                            :limit => 11
    t.string   "yacht_name"
    t.boolean  "yacht_new"
    t.string   "yacht_location"
    t.integer  "yacht_specification_length",       :limit => 11
    t.string   "yacht_specification_manufacturer"
    t.string   "yacht_specification_model"
    t.integer  "yacht_specification_year",         :limit => 11
    t.string   "yacht_specification_designer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "photos", :force => true do |t|
    t.integer  "listing_id",   :limit => 11
    t.string   "url"
    t.string   "small_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "parent_id",    :limit => 11
    t.string   "thumbnail"
    t.integer  "size",         :limit => 11
    t.integer  "width",        :limit => 11
    t.integer  "height",       :limit => 11
    t.integer  "order",        :limit => 11
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
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

end
