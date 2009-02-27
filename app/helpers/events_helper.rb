module EventsHelper
  def event_types
    CalendarEventType.all.collect {|t| [t.desc, t.name]}
  end
end
