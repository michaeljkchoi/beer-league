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

ActiveRecord::Schema.define(version: 20150205063020) do

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "games", force: true do |t|
    t.integer  "series_id"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
  end

  add_index "games", ["away_team_id"], name: "index_games_on_away_team_id", using: :btree
  add_index "games", ["home_team_id"], name: "index_games_on_home_team_id", using: :btree
  add_index "games", ["series_id"], name: "index_games_on_series_id", using: :btree

  create_table "goals", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "scorer_id"
    t.integer  "primary_assister_id"
    t.integer  "secondary_assister_id"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["game_id"], name: "index_goals_on_game_id", using: :btree
  add_index "goals", ["primary_assister_id"], name: "index_goals_on_primary_assister_id", using: :btree
  add_index "goals", ["scorer_id"], name: "index_goals_on_scorer_id", using: :btree
  add_index "goals", ["secondary_assister_id"], name: "index_goals_on_secondary_assister_id", using: :btree
  add_index "goals", ["team_id"], name: "index_goals_on_team_id", using: :btree

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "number"
    t.string   "email"
    t.string   "phone_number"
    t.string   "profile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "reserve",      default: false
    t.string   "slug"
  end

  add_index "players", ["slug"], name: "index_players_on_slug", unique: true, using: :btree

  create_table "rosters", force: true do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rosters", ["player_id"], name: "index_rosters_on_player_id", using: :btree
  add_index "rosters", ["team_id"], name: "index_rosters_on_team_id", using: :btree

  create_table "series", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "captain_id"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "series_id"
  end

  add_index "teams", ["captain_id"], name: "index_teams_on_captain_id", using: :btree
  add_index "teams", ["series_id"], name: "index_teams_on_series_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
