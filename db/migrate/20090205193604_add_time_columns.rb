class AddTimeColumns < ActiveRecord::Migration
  def self.up
    add_column :calendar_events, :start_time, :time
    add_column :calendar_events, :end_time, :time
  end

  def self.down
    remove_column :calendar_events, :start_time
    remove_column :calendar_events, :end_time
  end
end
