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

ActiveRecord::Schema.define(version: 20180222101329) do

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "vip_number"
    t.string   "phone"
    t.string   "address"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "date"
    t.integer  "customer_id"
    t.string   "customer_order_no"
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "product_qty"
    t.float   "product_price"
    t.integer "product_status", default: 0
  end

  create_table "product_promotions", force: :cascade do |t|
    t.integer "product_id"
    t.integer "promotion_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "author"
    t.string   "title"
    t.integer  "year"
    t.string   "publisher"
    t.string   "description"
    t.float    "price"
    t.datetime "first_creation_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "front_page_file_name"
    t.string   "front_page_content_type"
    t.integer  "front_page_file_size"
    t.datetime "front_page_updated_at"
  end

  create_table "promotions", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "discount_amount"
  end

end