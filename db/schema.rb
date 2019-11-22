ActiveRecord::Schema.define(version: 2019_11_21_152921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "applicant_id"
    t.bigint "listing_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string "subject"
    t.text "description"
    t.string "date"
    t.string "end_date"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.boolean "paying"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "principal_role"
    t.string "principal_instrument"
    t.string "image_url"
    t.text "bio"
    t.text "credits"
    t.string "website_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
