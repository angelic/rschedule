module ApplicationHelper
  include ScheduleFu::CalendarHelper
  include ScheduleFu::ScheduleFuHelper

  def flash_div *keys
    divs = "".html_safe
    keys.each do |k|
      divs << content_tag(:div, flash[k], :class => "flash #{k}", :id => "flash-#{k}")
    end
    divs
  end
  
  def close_link
    content_tag(:div, :class => "sf-close") do
      link_to "X", "#"
    end
  end
end
