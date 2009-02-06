require 'chronic'

class CalendarController < ApplicationController
  before_filter :set_calendar
  
  def set_calendar
    @calendar = Calendar.first
  end
end
