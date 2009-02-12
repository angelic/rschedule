module ApplicationHelper
  include ScheduleFu::CalendarHelper
  include ScheduleFu::ScheduleFuHelper

  def flash_div *keys
    divs = keys.collect do |k|
      content_tag :div, flash[k], :class => "flash #{k}", :id => "flash-#{k}"
    end
    divs.join
  end
  
  def chronic_date_string(*args)
    chronic_date(*args).to_s
  end
  
  def close_link(close_id)
    content_tag(:div, :class => "sf-close") do
      link_to_function "X", "Element.hide($('#{close_id}'))"
    end
  end
end
