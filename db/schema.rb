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

ActiveRecord::Schema.define(version: 20150417182523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dinner_guests", force: :cascade do |t|
    t.integer  "guest_id"
    t.integer  "dinner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dinner_guests", ["dinner_id"], name: "index_dinner_guests_on_dinner_id", using: :btree
  add_index "dinner_guests", ["guest_id", "dinner_id"], name: "index_dinner_guests_on_guest_id_and_dinner_id", unique: true, using: :btree
  add_index "dinner_guests", ["guest_id"], name: "index_dinner_guests_on_guest_id", using: :btree

  create_table "dinners", force: :cascade do |t|
    t.integer  "host_id"
    t.string   "name"
    t.string   "location"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "guest_emails", default: ""
    t.date     "date"
    t.time     "time"
  end

  create_table "menu_recipes", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "recipe_id"
    t.integer  "chef_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "course_name"
  end

  add_index "menu_recipes", ["menu_id"], name: "index_menu_recipes_on_menu_id", using: :btree
  add_index "menu_recipes", ["recipe_id"], name: "index_menu_recipes_on_recipe_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.integer  "dinner_id"
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "finalized",  default: false
    t.boolean  "election",   default: false
    t.date     "exp_date"
  end

  create_table "recipe_courses", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipe_courses", ["course_id"], name: "index_recipe_courses_on_course_id", using: :btree
  add_index "recipe_courses", ["recipe_id", "course_id"], name: "index_recipe_courses_on_recipe_id_and_course_id", unique: true, using: :btree
  add_index "recipe_courses", ["recipe_id"], name: "index_recipe_courses_on_recipe_id", using: :btree

  create_table "recipe_cuisines", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipe_cuisines", ["cuisine_id"], name: "index_recipe_cuisines_on_cuisine_id", using: :btree
  add_index "recipe_cuisines", ["recipe_id", "cuisine_id"], name: "index_recipe_cuisines_on_recipe_id_and_cuisine_id", unique: true, using: :btree
  add_index "recipe_cuisines", ["recipe_id"], name: "index_recipe_cuisines_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "source_url"
    t.text     "instructions"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "primary_ingredient"
    t.float    "rating"
    t.string   "image_url"
    t.integer  "review_count"
    t.integer  "cook_time"
    t.string   "servings"
    t.text     "ingredients"
    t.string   "description"
    t.string   "big_oven_id"
    t.integer  "cuisine_id"
    t.boolean  "appetizer",          default: false
    t.boolean  "main",               default: false
    t.boolean  "side",               default: false
    t.boolean  "dessert",            default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "provider"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "menu_recipe_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
