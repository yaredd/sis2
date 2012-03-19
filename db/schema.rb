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

ActiveRecord::Schema.define(:version => 20120316020535) do

  create_table "bench_marks", :force => true do |t|
    t.string  "name"
    t.integer "standard_id"
  end

  add_index "bench_marks", ["standard_id"], :name => "index_bench_marks_on_standard_id"

  create_table "blocks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "courseNumber"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "efforts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "extended_grades", :force => true do |t|
    t.integer  "grade_id"
    t.integer  "benchMark_id"
    t.string   "bmGrade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "extended_grades", ["benchMark_id"], :name => "index_extended_grades_on_benchMark_id"
  add_index "extended_grades", ["grade_id"], :name => "index_extended_grades_on_grade_id"

  create_table "grades", :force => true do |t|
    t.integer  "schedule_id"
    t.integer  "mark_id"
    t.integer  "effort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "grading_period"
    t.text     "comment"
  end

  add_index "grades", ["effort_id"], :name => "index_grades_on_effort_id"
  add_index "grades", ["mark_id"], :name => "index_grades_on_mark_id"
  add_index "grades", ["schedule_id"], :name => "index_grades_on_schedule_id"

  create_table "interim_grades", :force => true do |t|
    t.integer  "schedule_id"
    t.integer  "mark_id"
    t.integer  "effort_id"
    t.string   "grading_period"
    t.string   "on_task"
    t.string   "positive_attitude"
    t.string   "comes_prepared"
    t.string   "attends_class"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interim_grades", ["effort_id"], :name => "index_interim_grades_on_effort_id"
  add_index "interim_grades", ["mark_id"], :name => "index_interim_grades_on_mark_id"
  add_index "interim_grades", ["schedule_id"], :name => "index_interim_grades_on_schedule_id"

  create_table "marks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.date     "startDate"
    t.date     "endDate"
    t.integer  "school_setup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "periods", ["school_setup_id"], :name => "index_periods_on_school_setup_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "schedules", :force => true do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.integer  "teacher_id"
    t.integer  "period_id"
    t.integer  "block_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["block_id"], :name => "index_schedules_on_block_id"
  add_index "schedules", ["period_id"], :name => "index_schedules_on_period_id"
  add_index "schedules", ["section_id"], :name => "index_schedules_on_section_id"
  add_index "schedules", ["student_id"], :name => "index_schedules_on_student_id"
  add_index "schedules", ["teacher_id"], :name => "index_schedules_on_teacher_id"

  create_table "school_setups", :force => true do |t|
    t.string   "name"
    t.string   "schoolYear"
    t.string   "principal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_comments", :force => true do |t|
    t.integer  "section_id"
    t.integer  "teacher_id"
    t.string   "period"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "section_comments", ["section_id"], :name => "index_section_comments_on_section_id"
  add_index "section_comments", ["teacher_id"], :name => "index_section_comments_on_teacher_id"

  create_table "sections", :force => true do |t|
    t.integer  "course_id"
    t.integer  "sectionNumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["course_id"], :name => "index_sections_on_course_id"

  create_table "standards", :force => true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "standards", ["course_id"], :name => "index_standards_on_course_id"

  create_table "students", :force => true do |t|
    t.string   "adminPlusId"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "middleName"
    t.string   "gender"
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
    t.integer  "attendance_tardy"
    t.float    "attendance_absent"
  end

  create_table "teachers", :force => true do |t|
    t.string   "staffId"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.integer  "sign_in_count",                     :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
  end

end
