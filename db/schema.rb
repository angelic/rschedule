# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090204171400) do

  create_table "calendar_dates", :force => true do |t|
    t.date    "value",                                       :null => false
    t.integer "calendar_id",                                 :null => false
    t.integer "weekday",     :limit => 1,                    :null => false
    t.integer "monthweek",   :limit => 1,                    :null => false
    t.integer "monthday",    :limit => 1,                    :null => false
    t.integer "lastweek",    :limit => 1, :default => 0,     :null => false
    t.boolean "holiday",                  :default => false, :null => false
  end

  create_table "calendar_events", :force => true do |t|
    t.integer "calendar_id", :null => false
    t.date    "start_date"
    t.date    "end_date"
  end

  create_table "calendar_occurrences", :id => false, :force => true do |t|
    t.integer "calendar_event_id", :null => false
    t.integer "calendar_date_id",  :null => false
  end

  create_table "calendar_recurrences", :force => true do |t|
    t.integer "calendar_event_id",              :null => false
    t.integer "weekday",           :limit => 1
    t.integer "monthweek",         :limit => 1
    t.integer "monthday",          :limit => 1
  end

  create_table "calendars", :force => true do |t|
  end

end
