class CalendarController < ApplicationController
  def index
    c = Calendar.first
    @dates = c.dates.find_by_dates(Date.parse('2008-12-17')..Date.parse('2008-12-23'))
  end
end
