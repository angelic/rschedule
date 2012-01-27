class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_calendar

  protected
  def set_calendar
    @calendar = Calendar.first
  end
end
