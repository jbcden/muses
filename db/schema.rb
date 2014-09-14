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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140528213042) do

  create_table "campaigns", :force => true do |t|
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "preferred_name"
    t.string   "state"
    t.string   "city"
    t.string   "instrument"
    t.string   "target_amount"
    t.string   "age"
    t.text     "bio",                          :limit => 255
    t.integer  "student_id"
    t.string   "description"
    t.string   "title"
    t.integer  "progress",                                    :default => 0
    t.date     "target_date"
  end

  create_table "donations", :force => true do |t|
    t.integer  "campaign_id"
    t.integer  "donor_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "customer_id"
    t.boolean  "is_paid",     :default => false
  end

  create_table "donors", :force => true do |t|
    t.string   "email",                        :default => "", :null => false
    t.string   "encrypted_password",           :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
  end

  add_index "donors", ["email"], :name => "index_donors_on_email", :unique => true
  add_index "donors", ["reset_password_token"], :name => "index_donors_on_reset_password_token", :unique => true

  create_table "student_applications", :force => true do |t|
    t.string   "who"
    t.string   "s_last"
    t.string   "s_middle"
    t.string   "s_first"
    t.string   "s_nickname"
    t.string   "s_gender"
    t.string   "s_grade"
    t.string   "s_school"
    t.string   "school_city"
    t.string   "s_age"
    t.date     "dob"
    t.string   "g1_last"
    t.string   "g1_middle"
    t.string   "g1_first"
    t.string   "g1_relation"
    t.string   "g1_occupation"
    t.string   "g1_edu"
    t.string   "g2_last"
    t.string   "g2_middle"
    t.string   "g2_first"
    t.string   "g2_relation"
    t.string   "g2_occupation"
    t.string   "g2_edu"
    t.string   "primary_addr"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.string   "circumstances"
    t.string   "household_income"
    t.string   "amount_debt"
    t.string   "amount_savings"
    t.string   "amount_assets"
    t.string   "financial_doc_file_name"
    t.string   "financial_doc_content_type"
    t.integer  "financial_doc_file_size"
    t.datetime "financial_doc_updated_at"
    t.text     "s_about"
    t.text     "s_living"
    t.text     "s_proj_description"
    t.text     "s_important"
    t.text     "s_favorite_part"
    t.text     "s_tell_donors"
    t.string   "s_picture_file_name"
    t.string   "s_picture_content_type"
    t.integer  "s_picture_file_size"
    t.datetime "s_picture_updated_at"
    t.string   "g_picture_file_name"
    t.string   "g_picture_content_type"
    t.integer  "g_picture_file_size"
    t.datetime "g_picture_updated_at"
    t.string   "disciplinary"
    t.string   "g_convicted"
    t.text     "gc_description"
    t.string   "conf_name"
    t.string   "conf_relation"
    t.string   "conf_full"
    t.date     "conf_date"
    t.integer  "student_id"
  end

  create_table "students", :force => true do |t|
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "students", ["confirmation_token"], :name => "index_students_on_confirmation_token", :unique => true
  add_index "students", ["email"], :name => "index_students_on_email", :unique => true
  add_index "students", ["reset_password_token"], :name => "index_students_on_reset_password_token", :unique => true

end
