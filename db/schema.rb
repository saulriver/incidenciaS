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

ActiveRecord::Schema.define(version: 2020_03_23_232029) do

  create_table "applicationclients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "application_id"
    t.bigint "client_id"
    t.integer "servicelevel"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_applicationclients_on_application_id"
    t.index ["client_id"], name: "index_applicationclients_on_client_id"
    t.index ["user_id"], name: "index_applicationclients_on_user_id"
  end

  create_table "applicationoperators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "application_id"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_applicationoperators_on_application_id"
    t.index ["user_id"], name: "index_applicationoperators_on_user_id"
  end

  create_table "applications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "message"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "nit"
    t.string "name"
    t.string "reason"
    t.string "addres"
    t.string "telephone"
    t.string "contact"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consults", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "criticalities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incident_admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "incidentfiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "incident_id"
    t.string "filetype"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_incidentfiles_on_incident_id"
  end

  create_table "incidentmanagements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "incident_id"
    t.datetime "datereport"
    t.text "description"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.datetime "Tlevel"
    t.datetime "Littletime"
    t.datetime "Overtime"
    t.index ["incident_id"], name: "index_incidentmanagements_on_incident_id"
    t.index ["user_id"], name: "index_incidentmanagements_on_user_id"
  end

  create_table "incidents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "area_id"
    t.bigint "userapplication_id"
    t.bigint "user_id"
    t.bigint "criticality_id"
    t.datetime "datereport"
    t.text "description"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["area_id"], name: "index_incidents_on_area_id"
    t.index ["criticality_id"], name: "index_incidents_on_criticality_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
    t.index ["userapplication_id"], name: "index_incidents_on_userapplication_id"
  end

  create_table "logins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managefiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "incidentmanagement_id"
    t.string "filetype"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incidentmanagement_id"], name: "index_managefiles_on_incidentmanagement_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userapplications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "applicationclient_id"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicationclient_id"], name: "index_userapplications_on_applicationclient_id"
    t.index ["user_id"], name: "index_userapplications_on_user_id"
  end

  create_table "userareas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "area_id"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_userareas_on_area_id"
    t.index ["user_id"], name: "index_userareas_on_user_id"
  end

  create_table "userclients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "user_id"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_userclients_on_client_id"
    t.index ["user_id"], name: "index_userclients_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "role_id"
    t.string "username"
    t.string "password"
    t.boolean "change_password"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "login_id"
    t.index ["login_id"], name: "index_users_on_login_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "applicationclients", "applications"
  add_foreign_key "applicationclients", "clients"
  add_foreign_key "applicationclients", "users"
  add_foreign_key "applicationoperators", "applications"
  add_foreign_key "applicationoperators", "users"
  add_foreign_key "incidentfiles", "incidents"
  add_foreign_key "incidentmanagements", "incidents"
  add_foreign_key "incidentmanagements", "users"
  add_foreign_key "incidents", "areas"
  add_foreign_key "incidents", "criticalities"
  add_foreign_key "incidents", "userapplications"
  add_foreign_key "incidents", "users"
  add_foreign_key "managefiles", "incidentmanagements"
  add_foreign_key "userapplications", "applicationclients"
  add_foreign_key "userapplications", "users"
  add_foreign_key "userareas", "areas"
  add_foreign_key "userareas", "users"
  add_foreign_key "userclients", "clients"
  add_foreign_key "userclients", "users"
  add_foreign_key "users", "logins"
  add_foreign_key "users", "roles"
end
