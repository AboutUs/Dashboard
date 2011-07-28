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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110728182755) do

  create_table "data_points", :force => true do |t|
    t.string   "family"
    t.string   "name"
    t.integer  "value_num"
    t.string   "value_str"
    t.datetime "recorded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_points", ["family", "name"], :name => "index_data_points_on_family_and_name"
  add_index "data_points", ["name"], :name => "index_data_points_on_name"
  add_index "data_points", ["recorded_at"], :name => "index_data_points_on_recorded_at"
  add_index "data_points", ["value_num"], :name => "index_data_points_on_value_num"
  add_index "data_points", ["value_str"], :name => "index_data_points_on_value_str"

  create_table "memberships", :force => true do |t|
    t.integer  "perspective_id"
    t.string   "family"
    t.string   "name"
    t.boolean  "featured"
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perspectives", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
