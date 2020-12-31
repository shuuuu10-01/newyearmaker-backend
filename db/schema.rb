# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_31_024825) do

  create_table "cards", force: :cascade do |t|
    t.string "uid"
    t.string "text"
    t.string "gif"
    t.string "share"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "public_uid"
    t.string "display_name"
    t.index ["public_uid"], name: "index_cards_on_public_uid", unique: true
  end

  create_table "recieves", force: :cascade do |t|
    t.string "uid"
    t.string "display_name"
    t.string "public_uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
