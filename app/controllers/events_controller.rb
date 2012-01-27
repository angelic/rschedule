class EventsController < ApplicationController
  def create
    @calendar_event = @calendar.events.create(params[:calendar_event])
    respond_to_change
  end
  
  def new
    @calendar_event = CalendarEvent.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def edit
    @calendar_event = CalendarEvent.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end 
  end
  
  def update
    @calendar_event = CalendarEvent.find(params[:id])
    @calendar_event.update_attributes(params[:calendar_event]) if @calendar_event
    respond_to_change
  end

  def destroy
    @calendar_event = CalendarEvent.destroy(params[:id])
    respond_to_change
  end
  
  protected
  def respond_to_change
    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.js { render :update }
    end
  end    
end
