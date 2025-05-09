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

ActiveRecord::Schema[7.0].define(version: 2024_12_23_041643) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blueprint_elements", force: :cascade do |t|
    t.bigint "blueprint_id", null: false
    t.bigint "element_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blueprint_id"], name: "index_blueprint_elements_on_blueprint_id"
    t.index ["element_id"], name: "index_blueprint_elements_on_element_id"
  end

  create_table "blueprint_spirits", force: :cascade do |t|
    t.bigint "blueprint_id", null: false
    t.bigint "spirit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blueprint_id"], name: "index_blueprint_spirits_on_blueprint_id"
    t.index ["spirit_id"], name: "index_blueprint_spirits_on_spirit_id"
  end

  create_table "blueprint_types", force: :cascade do |t|
    t.string "type_id"
    t.string "description_en"
    t.string "description_zh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blueprint_workers", force: :cascade do |t|
    t.bigint "blueprint_id", null: false
    t.bigint "worker_id", null: false
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blueprint_id"], name: "index_blueprint_workers_on_blueprint_id"
    t.index ["worker_id"], name: "index_blueprint_workers_on_worker_id"
  end

  create_table "blueprints", force: :cascade do |t|
    t.string "name_en"
    t.string "name_zh"
    t.string "blueprint_id"
    t.bigint "type_id", null: false
    t.integer "research_scrolls"
    t.integer "tier"
    t.integer "value"
    t.integer "craft_time"
    t.integer "merchant_xp"
    t.integer "worker_xp"
    t.integer "fusion_xp"
    t.integer "antique_tokens"
    t.integer "favor"
    t.integer "airship_power"
    t.integer "discount_energy"
    t.integer "surcharge_energy"
    t.integer "suggest_energy"
    t.integer "speed_up_energy"
    t.integer "atk"
    t.integer "def"
    t.integer "hp"
    t.decimal "eva"
    t.decimal "crit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "unlock_type_id", null: false
    t.index ["type_id"], name: "index_blueprints_on_type_id"
    t.index ["unlock_type_id"], name: "index_blueprints_on_unlock_type_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name_en"
    t.string "name_zh"
    t.string "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components", force: :cascade do |t|
    t.string "name_en"
    t.string "name_zh"
    t.string "component_id"
    t.integer "tier"
    t.integer "value"
    t.string "get_from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elements", force: :cascade do |t|
    t.string "element_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.bigint "blueprint_id", null: false
    t.string "materialable_type", null: false
    t.bigint "materialable_id", null: false
    t.bigint "quality_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blueprint_id"], name: "index_materials_on_blueprint_id"
    t.index ["materialable_type", "materialable_id"], name: "index_materials_on_materialable"
    t.index ["quality_id"], name: "index_materials_on_quality_id"
  end

  create_table "qualities", force: :cascade do |t|
    t.string "quality_id"
    t.string "name_en"
    t.string "name_zh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string "name_en"
    t.string "name_zh"
    t.string "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spirits", force: :cascade do |t|
    t.string "spirit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name_en"
    t.string "name_zh"
    t.string "type_id"
    t.string "folder_name"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_types_on_category_id"
  end

  create_table "unlock_types", force: :cascade do |t|
    t.string "type_id"
    t.string "description_en"
    t.string "description_zh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "worker_id"
    t.string "name_en"
    t.string "name_zh"
    t.string "profession_en"
    t.string "profession_zh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blueprint_elements", "blueprints"
  add_foreign_key "blueprint_elements", "elements"
  add_foreign_key "blueprint_spirits", "blueprints"
  add_foreign_key "blueprint_spirits", "spirits"
  add_foreign_key "blueprint_workers", "blueprints"
  add_foreign_key "blueprint_workers", "workers"
  add_foreign_key "blueprints", "types"
  add_foreign_key "blueprints", "unlock_types"
  add_foreign_key "materials", "blueprints"
  add_foreign_key "materials", "qualities"
  add_foreign_key "types", "categories"
end
