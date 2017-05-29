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

ActiveRecord::Schema.define(version: 20170529134140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuisines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.float    "amount"
    t.string   "unit"
    t.string   "ingredient"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree
  end

  create_table "instructions", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "step"
    t.string   "title"
    t.text     "description"
    t.string   "step_photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["recipe_id"], name: "index_instructions_on_recipe_id", using: :btree
  end

  create_table "main_ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "servings"
    t.integer  "cooktime1"
    t.integer  "cooktime2"
    t.string   "food_photo"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "cuisine_id"
    t.integer  "main_ingredient_id"
    t.index ["cuisine_id"], name: "index_recipes_on_cuisine_id", using: :btree
    t.index ["main_ingredient_id"], name: "index_recipes_on_main_ingredient_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.date     "birthday"
    t.string   "phone_no"
    t.string   "street"
    t.string   "city"
    t.integer  "postcode"
    t.string   "state"
    t.string   "avatar"
    t.string   "password_digest"
    t.string   "reset_password_token"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["name"], name: "index_users_on_name", using: :btree
  end

end
