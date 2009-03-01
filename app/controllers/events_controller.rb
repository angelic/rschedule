class EventsController < ApplicationController
  def create
    @calendar_event = @calendar.events.create(params[:calendar_event])
    respond_to_change
  end
  
  def new
    @calendar_event = CalendarEvent.new
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def edit
    @calendar_event = CalendarEvent.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render :layout => false }
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
      format.js do
        render :update do |page|
          if @calendar_event.errors.size > 0
            page.replace_html "flash-new-error", error_messages_for('calendar_event')
          else
            page.hide "sf-add-event"
          end
        end
      end
    end
  end    
end
