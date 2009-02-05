class AddTimeColumns < ActiveRecord::Migration
  def self.up
    add_column :calendar_events, :descr, :text
  end

  def self.down
    remove_column :calendar_events, :descr
  end
end
