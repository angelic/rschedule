module WeeksHelper
  def small_calendar
    calendar(:year => @selected_date.year, :month => @selected_date.mon,
        :abbrev => 0..0, :previous_month_text => previous_month_link,
        :next_month_text => next_month_link, 
        :month_name_array => Date::ABBR_MONTHNAMES, 
        :display_year => @selected_date.strftime("%y")) do |d|
      [link_to(d.mday, change_week_week_url(d.to_date.to_s), 
          :remote => true, :class => "normalDay")]
    end
  end

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
    event_desc_to_size(event, 25) if event
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
    day = 7.days.ago(@selected_date.wday.ago(@selected_date))
    link_to("<", change_week_week_url(day), :remote => true)
  end
  
  def next_week_link
    day = 7.days.since(@selected_date.wday.ago(@selected_date))
    link_to(">", change_week_week_url(day), :remote => true)
  end
  
  def today_link
    link_to("Today", change_week_week_url(Time.now.to_date.to_s), :remote => true)
  end
 
  def hidden_nav_link
    link_to("", change_week_week_url(@selected_date), :remote => true, :id => 'sf-selected-date-nav-link')
  end

  def previous_month_link
    day = 1.day.ago @selected_date.beginning_of_month
    content_tag(:span, :id => 'sf-previous-month-link') do
      link_to "<", change_month_week_url(day), :remote => true
    end
  end
  
  def next_month_link
    day = 1.day.since @selected_date.end_of_month
    content_tag(:span, :id => 'sf-next-month-link') do
      link_to ">", change_month_week_url(day), :remote => true
    end
  end
  
  def add_event_link
    link_to("Add Event", new_event_url, :remote => true, :id => "sf-add-event-link")
  end
  
  def edit_event_link(event)
    return if event.nil?
    link_to "", edit_event_url(event), :class => "sf-hidden-edit-event-link", :remote => true
  end
end
