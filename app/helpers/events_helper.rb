module EventsHelper
  def event_types
    CalendarEventType.all.collect {|t| [t.desc, t.id]}
  end
  
  def recurrence_style(*event_types)
    display = event_types.any? {|t| @calendar_event.is_event_type?(t)}
    style = display ? "block" : "none"
    "display: #{style};"
  end
end
