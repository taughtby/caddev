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

ActiveRecord::Schema.define(:version => 20120607044620) do

  create_table "faqs", :force => true do |t|
    t.integer  "tutor_id"
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "major_subject_areas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "study_group_comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "study_group_post_id"
    t.integer  "comment_id"
    t.text     "body"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "study_group_posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "study_group_id"
    t.text     "title"
    t.text     "body"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "study_group_registrations", :force => true do |t|
    t.integer  "study_group_id"
    t.integer  "student_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "study_groups", :force => true do |t|
    t.integer  "tutor_id"
    t.integer  "subject_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "student_limit"
    t.integer  "cost_per_hour"
    t.text     "syllabus"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "major_subject_area_id"
  end

  create_table "tutor_materials", :force => true do |t|
    t.integer  "tutor_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tutor_review_replies", :force => true do |t|
    t.integer  "tutor_review_id"
    t.integer  "tutor_id"
    t.text     "explanation_text"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "tutor_reviews", :force => true do |t|
    t.integer  "student_id"
    t.integer  "stars"
    t.text     "review_text"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "tutor_id"
  end

  create_table "tutors", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "tutor_welcome"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
  end

  create_table "zipcodes", :force => true do |t|
    t.string   "code"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
