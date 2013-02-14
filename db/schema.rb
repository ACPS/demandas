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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130207014227) do

  create_table "demands", :force => true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "address"
    t.text     "case"
    t.string   "estado"
    t.integer  "dependency_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "demands", ["dependency_id"], :name => "index_demands_on_dependency_id"

  create_table "dependencies", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.integer  "tipo"
    t.string   "email"
    t.string   "cellphone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
