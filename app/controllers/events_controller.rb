class EventsController < ApplicationController
  def create
    params[:calendar_event][:calendar_event_type_id] = params[:calendar_event].delete(:event_type)
    @calendar_event = @calendar.events.create(params[:calendar_event])
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
