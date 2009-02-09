module WeeksHelper
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
  
  def event_day_desc(event)
    event_desc_to_size(event, 10) if event
  end
  
  def event_hour_desc(event)
    event_desc_to_size(event, 50) if event
  end
  
  def event_desc_to_size(event, size)
    "#{recurring_symbol(event)}#{event.desc}"[0,size]
  end
  
  def recurring_symbol(event)
    'R ' if event.recurrences.size > 0 
  end
  
  def previous_week_link
    link_to_remote "<", :update => "sf-main-calendar", 
        :url => next_or_last_week_url(:past)
  end
  
  def next_week_link
    link_to_remote ">", :update => "sf-main-calendar",
        :url => next_or_last_week_url(:future)
  end
  
  def previous_month_link
    content_tag(:span, :id => 'sf-previous-month-link') do
      link_to_remote "<", :update => "sf-small-calendar", 
        :url => next_or_last_month_url('last month')
    end
  end
  
  def next_month_link
    content_tag(:span, :id => 'sf-next-month-link') do
      link_to_remote ">", :update => "sf-small-calendar", 
          :url => next_or_last_month_url('next month')
    end
  end
  
  protected
  def next_or_last_week_url(context)
    sunday = Chronic.parse('sunday', :now => @selected_date, :context => context)
    change_week_week_url(sunday.to_date.to_s)
  end
  
  def next_or_last_month_url(text)
    day = Chronic.parse(text, :now => @selected_date)
    change_month_week_url(day)
  end
end
