module EventsHelper
  def event_types
    CalendarEventType.all.collect {|t| [t.desc, t.id]}
  end
  
  def recurrence_style(*event_types)
    display = @calendar_event.event_type_matches?(*event_types)
    style = display ? "block" : "none"
    "display: #{style};"
  end
end
