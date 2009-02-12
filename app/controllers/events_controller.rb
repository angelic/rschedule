class EventsController < ApplicationController
  def create
    @calendar_event = @calendar.events.create_for(params[:calendar_event][:start_date])
    @calendar_event.update_attributes(params[:calendar_event])
    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.js
    end
  end
  
  def new
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
end
