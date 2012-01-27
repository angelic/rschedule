class WeeksController < ApplicationController
  include ScheduleFu::ScheduleFuHelper
  
  def index
    show
    render :action => 'show'
  end
  
  def show
    params[:id] ||= session[:sf_week_sunday]
    sunday = previous_sunday(params[:id])
    session[:sf_week_sunday] = sunday.to_s
    saturday = 6.days.since sunday
    set_dates sunday..saturday
  end
  
  def change_month
    @selected_date = parse_date_or_now(params[:id]) 
  end
  
  def change_week
    show
  end
  
  protected
  
  def set_dates(range)
    @dates = CalendarDate.get_and_create_dates(range)
    max = @calendar.max_events_per_day_without_time_set(range)
    @without_time_range = 0..(max - 1)
    @selected_date = parse_date_or_now(params[:id]) 
  end
end
