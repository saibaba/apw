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

ActiveRecord::Schema.define(version: 20131122193254) do

  create_table "applications", force: true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.integer  "servers"
    t.integer  "tiers"
    t.string   "style"
    t.string   "provider"
    t.string   "customization"
    t.string   "consumer"
    t.string   "consumption"
    t.string   "transport"
    t.string   "integration"
    t.string   "inhouse"
    t.string   "contracted"
    t.string   "criticality"
    t.string   "sensitivity"
    t.string   "regulatory"
    t.string   "constraint"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bucket"
    t.string   "phase"
    t.string   "solution"
  end

  create_table "consumers", force: true do |t|
    t.string   "name"
    t.decimal  "share"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumptions", force: true do |t|
    t.string   "name"
    t.decimal  "share"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "criticalities", force: true do |t|
    t.string   "name"
    t.decimal  "share"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "name"
    t.decimal  "share"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.string   "name"
    t.decimal  "share"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regulatories", force: true do |t|
    t.string   "name"
    t.decimal  "share"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transports", force: true do |t|
    t.string   "name"
    t.decimal  "share"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "windows", force: true do |t|
    t.string   "name"
    t.decimal  "share"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yesnos", force: true do |t|
    t.string   "name"
    t.decimal  "share"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
