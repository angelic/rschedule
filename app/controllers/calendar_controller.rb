class CalendarController < ApplicationController
  def index
    c = Calendar.first
    range = Date.parse('2008-12-17')..Date.parse('2008-12-23')
    @dates = c.dates.find_by_dates(range)
    max = c.max_events_per_day_without_time_set(range)
    @without_time_range = 0..(max - 1)
  end
end
