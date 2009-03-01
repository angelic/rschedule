module ApplicationHelper
  include ScheduleFu::CalendarHelper
  include ScheduleFu::ScheduleFuHelper

  def flash_div *keys
    divs = keys.collect do |k|
      content_tag :div, flash[k], :class => "flash #{k}", :id => "flash-#{k}"
    end
    divs.join
  end
  
  def close_link(close_id)
    content_tag(:div, :class => "sf-close") do
      link_to_function "X", "Element.hide($('#{close_id}'))"
    end
  end
  
  def dynamic_javascript
    javascript_tag <<-END_JS
    function display_recurrence_options() {
      ['sf-recurrence-repeat-by', 'sf-recurrence-weekly', 'sf-recurrence-monthly', 'sf-recurrence-yearly'].each(Element.hide);
      switch($('calendar_event_calendar_event_type_id').value) {
      case "#{CalendarEventType.find_by_name('weekly').id}": Element.show($('sf-recurrence-weekly')); break;
      case "#{CalendarEventType.find_by_name('monthly').id}": ['sf-recurrence-repeat-by', 'sf-recurrence-monthly'].each(Element.show); break;
      case "#{CalendarEventType.find_by_name('yearly').id}": ['sf-recurrence-repeat-by', 'sf-recurrence-yearly'].each(Element.show); break;
      }
    }
    END_JS
  end
end
