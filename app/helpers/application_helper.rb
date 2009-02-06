module ApplicationHelper
  include ScheduleFu::CalendarHelper
  include ScheduleFu::ScheduleFuHelper

  def chronic_date_string(*args)
    chronic_date(*args).to_s
  end
end
