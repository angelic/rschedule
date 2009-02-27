require_dependency "#{RAILS_ROOT}/vendor/plugins/schedule_fu/app/models/calendar_event.rb"
class CalendarEvent < ActiveRecord::Base
  attr_accessor :repeat_by
  (0..6).each {|n| attr_accessor "repeat_#{n}".to_sym }
end
