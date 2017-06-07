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

ActiveRecord::Schema.define(version: 20170203151705) do

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "firstname"
    t.string  "lastname"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin",           default: false
  end

  create_table "order_lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "qty",                                  default: 0,     null: false
    t.decimal "unit_price",  precision: 8,  scale: 2, default: "0.0", null: false
    t.decimal "total_price", precision: 10, scale: 2, default: "0.0", null: false
    t.index ["order_id"], name: "index_order_lines_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_lines_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "order_no",                                                    null: false
    t.decimal "total",       precision: 10, scale: 2, default: "0.0"
    t.integer "customer_id"
    t.date    "date",                                 default: '2017-06-07'
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "name",                                 null: false
    t.float   "price",       limit: 24, default: 0.0, null: false
    t.string  "description",                          null: false
    t.integer "status",                               null: false
  end

end
