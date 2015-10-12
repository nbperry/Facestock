class CalendarController < ApplicationController
  def index
    @events = Event.all
    @events = Event.between(params['start'], params['end']) if (params['start'] && params['end'])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end
end
