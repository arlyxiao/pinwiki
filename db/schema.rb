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

ActiveRecord::Schema.define(:version => 20120505063226) do

  create_table "answer_votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.boolean  "is_vote_up", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "question_id"
    t.text     "content"
    t.integer  "vote_sum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["parent_id"], :name => "index_categories_on_parent_id"

  create_table "comments", :force => true do |t|
    t.integer  "model_id"
    t.string   "model_type"
    t.integer  "creator_id"
    t.text     "content"
    t.integer  "reply_comment_id"
    t.integer  "reply_comment_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["creator_id"], :name => "index_comments_on_creator_id"
  add_index "comments", ["model_id", "model_type"], :name => "index_comments_on_model_id_and_model_type"
  add_index "comments", ["reply_comment_id"], :name => "index_comments_on_reply_comment_id"
  add_index "comments", ["reply_comment_user_id"], :name => "index_comments_on_reply_comment_user_id"

  create_table "courses", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.string   "cid"
    t.string   "department"
    t.string   "location"
    t.integer  "teacher_id"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["teacher_id"], :name => "index_courses_on_teacher_id"

  create_table "homework_assigns", :force => true do |t|
    t.integer  "student_id"
    t.integer  "homework_id"
    t.text     "content"
    t.boolean  "is_submit",    :default => false
    t.datetime "submitted_at"
    t.boolean  "has_finished", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "homework_assigns", ["homework_id"], :name => "index_homework_assigns_on_homework_id"
  add_index "homework_assigns", ["student_id"], :name => "index_homework_assigns_on_student_id"

  create_table "homework_student_upload_requirements", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "homework_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "homework_student_upload_requirements", ["creator_id"], :name => "index_homework_student_upload_requirements_on_creator_id"
  add_index "homework_student_upload_requirements", ["homework_id"], :name => "index_homework_student_upload_requirements_on_homework_id"

  create_table "homework_student_uploads", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "attachement_id"
    t.string   "attachement_file_name"
    t.string   "attachement_content_type"
    t.integer  "attachement_file_size"
    t.datetime "attachement_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "homework_student_uploads", ["creator_id"], :name => "index_homework_student_uploads_on_creator_id"

  create_table "homework_teacher_attachements", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "homework_id"
    t.string   "attachement_file_name"
    t.string   "attachement_content_type"
    t.integer  "attachement_file_size"
    t.datetime "attachement_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "homework_teacher_attachements", ["creator_id"], :name => "index_homework_teacher_attachements_on_creator_id"
  add_index "homework_teacher_attachements", ["homework_id"], :name => "index_homework_teacher_attachements_on_homework_id"

  create_table "homeworks", :force => true do |t|
    t.integer  "creator_id"
    t.string   "title"
    t.text     "content"
    t.integer  "course_id"
    t.datetime "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "homeworks", ["course_id"], :name => "index_homeworks_on_course_id"
  add_index "homeworks", ["creator_id"], :name => "index_homeworks_on_creator_id"

  create_table "media_files", :force => true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "place"
    t.text     "desc"
    t.integer  "creator_id"
    t.integer  "category_id"
    t.string   "video_encode_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "file_merged"
  end

  add_index "media_files", ["category_id"], :name => "index_media_files_on_category_id"
  add_index "media_files", ["creator_id"], :name => "index_media_files_on_creator_id"

  create_table "online_records", :force => true do |t|
    t.integer  "user_id"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "online_records", ["key"], :name => "index_online_records_on_key"
  add_index "online_records", ["user_id"], :name => "index_online_records_on_user_id"

  create_table "questions", :force => true do |t|
    t.integer  "creator_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "short_message_readings", :force => true do |t|
    t.integer  "short_message_id"
    t.integer  "user_id"
    t.integer  "contact_user_id"
    t.boolean  "is_read",          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "short_messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "content"
    t.boolean  "sender_read",   :default => false
    t.boolean  "receiver_read", :default => false
    t.boolean  "sender_hide",   :default => false
    t.boolean  "receiver_hide", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "real_name",  :default => "", :null => false
    t.string   "sid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["user_id"], :name => "index_students_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "creator_id"
    t.integer  "model_id"
    t.string   "model_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["creator_id"], :name => "index_taggings_on_creator_id"
  add_index "taggings", ["model_id", "model_type"], :name => "index_taggings_on_model_id_and_model_type"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", :force => true do |t|
    t.string   "real_name",  :default => "", :null => false
    t.string   "tid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachers", ["user_id"], :name => "index_teachers_on_user_id"

  create_table "team_students", :force => true do |t|
    t.integer  "team_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_students", ["student_id"], :name => "index_team_students_on_student_id"
  add_index "team_students", ["team_id"], :name => "index_team_students_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.string   "cid"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["teacher_id"], :name => "index_teams_on_teacher_id"

  create_table "users", :force => true do |t|
    t.string   "name",                      :default => "", :null => false
    t.string   "hashed_password",           :default => "", :null => false
    t.string   "salt",                      :default => "", :null => false
    t.string   "email",                     :default => "", :null => false
    t.string   "sign"
    t.string   "activation_code"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "activated_at"
    t.string   "reset_password_code"
    t.datetime "reset_password_code_until"
    t.datetime "last_login_time"
    t.boolean  "send_invite_email"
    t.integer  "reputation",                :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["name"], :name => "index_users_on_name"

  create_table "wiki_page_versions", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "wiki_page_id"
    t.string   "title"
    t.text     "content"
    t.integer  "audit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wiki_pages", :force => true do |t|
    t.integer  "creator_id"
    t.string   "title"
    t.text     "content"
    t.integer  "latest_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
