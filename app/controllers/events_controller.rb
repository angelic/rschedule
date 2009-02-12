class EventsController < ApplicationController
  def create
    recurrence_type = params[:calendar_event].delete(:recurrence_type)
    @calendar_event = @calendar.events.create_for(recurrence_type, params[:calendar_event])
    @calendar_event.update_attributes(params[:calendar_event])
    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.js
    end
  end
  
  def new
    @calendar_event = CalendarEvent.new
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
end
