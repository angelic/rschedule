class WeeksController < ApplicationController
  include ScheduleFu::ScheduleFuHelper
  
  before_filter :set_calendar
  
  def index
    show
    render :action => 'show'
  end
  
  def show
    params[:id] ||= session[:sf_week_sunday]
    sunday = previous_sunday(params[:id])
    session[:sf_week_sunday] = sunday.to_s
    saturday = chronic_date('saturday', :now => sunday)
    set_dates sunday..saturday
  end
  
  def change_month
    @selected_date = parse_date_or_now(params[:id]) 
    render :partial => 'small_calendar'
  end
  
  def change_week
    show
    render :partial => 'calendar'
  end
  
  protected
  
  def set_dates(range)
    @dates = CalendarDate.get_and_create_dates(range)
    max = @calendar.max_events_per_day_without_time_set(range)
    @without_time_range = 0..(max - 1)
    @selected_date = parse_date_or_now(params[:id]) 
  end
  
  def set_calendar
    @calendar = Calendar.first
  end
end
