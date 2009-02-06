module CalendarHelper
  def date_display
    return unless @dates
    from = @dates.first.value
    to = @dates.size > 1 ? @dates.last.value : nil
    
    from_display = from.strftime("%b %d")
    from_display << from.strftime(", %Y") unless to && from.year == to.year
    to_display = ""
    if to
      to_display << to.strftime("%b ") unless from.month == to.month
      to_display << to.strftime("%d, %Y")
    end
    "#{from_display} - #{to_display}"
  end
  
  def event_time(start_time, end_time)
    "#{time_format(start_time)} - #{time_format(end_time)}"
  end
  
  def time_format(time)
    time.strftime("%I:%M%p").downcase
  end
  
  def event_day_descr(event)
    event_descr_to_size(event, 10) if event
  end
  
  def event_hour_descr(event)
    event_descr_to_size(event, 50) if event
  end
  
  def event_descr_to_size(event, size)
    "#{recurring_symbol(event)}#{event.descr}"[0,size]
  end
  
  def recurring_symbol(event)
    'R ' if event.recurrences.size > 0 
  end
end
