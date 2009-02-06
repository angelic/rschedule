class WeeksController < ApplicationController
  before_filter :set_calendar
  
  def index
    redirect_to :action => 'show'
  end
  
  def show
    sunday = change_week || find_week
    session[:sf_sunday] = sunday.to_s
    saturday = Chronic.parse('saturday', :now => sunday).to_date
    range = sunday..saturday
    set_dates range
  end
  
  protected
  def change_week
    if session[:sf_sunday]
      if params[:id] == 'next'
        change_week_with_chronic(:future)
      elsif params[:id] == 'last'
        change_week_with_chronic(:past)
      end
    end
  end
  
  def find_week
    params[:id] ||= session[:sf_sunday]
    begin
      date = Date.parse(params[:id])
    rescue
      date = Time.now
    end
    sunday_this_week(date)
  end
  
  def change_week_with_chronic(context, now = Date.parse(session[:sf_sunday]))
    Chronic.parse('sunday', :now => now, :context => context).to_date
  end
  
  def sunday_this_week(date)
    date.wday == 0 ? date : change_week_with_chronic(:past, date)
  end
  
  def set_dates(range)
    @dates = @calendar.dates.find_by_dates(range)
    max = @calendar.max_events_per_day_without_time_set(range)
    @without_time_range = 0..(max - 1)
  end
  
  def set_calendar
    @calendar = Calendar.first
  end
end
