ActiveRecord::Schema.define(version: 00000000000000) do

  create_table "permissions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tenant_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "role_id", null: false
  end

  create_table "users_permissions", id: false, force: :cascade do |t|
    t.integer "permission_id",  null: false
    t.integer "user_id", null: false
  end

  create_table "roles_permissions", id: false, force: :cascade do |t|
    t.integer "permission_id",  null: false
    t.integer "role_id", null: false
  end
end
