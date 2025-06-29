# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_06_23_142131) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "public", default: false
    t.integer "likes_count", default: 0
  end

  create_table "collections_posts", id: false, force: :cascade do |t|
    t.bigint "collection_id", null: false
    t.bigint "post_id", null: false
    t.index ["collection_id", "post_id"], name: "index_collections_posts_on_collection_id_and_post_id"
    t.index ["post_id", "collection_id"], name: "index_collections_posts_on_post_id_and_collection_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "displays", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.string "name"
    t.integer "year"
    t.string "display_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.index ["post_id"], name: "index_displays_on_post_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "favouriteable_type", null: false
    t.bigint "favouriteable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favouriteable_type", "favouriteable_id"], name: "index_favourites_on_favouriteable"
    t.index ["user_id", "favouriteable_type", "favouriteable_id"], name: "index_favourites_on_user_and_favouriteable", unique: true
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.string "likable_type"
    t.integer "likable_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.string "post_image"
    t.integer "user_id"
    t.boolean "public", default: false
    t.string "secret"
    t.integer "amount"
    t.string "city"
    t.integer "price"
    t.integer "year"
    t.string "aspect_ratio"
    t.integer "likes_count", default: 0
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "bio"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "placed"
    t.string "contact"
    t.integer "total_likes", default: 0
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "displays", "posts"
  add_foreign_key "favourites", "users"
  add_foreign_key "taggings", "tags"
end
