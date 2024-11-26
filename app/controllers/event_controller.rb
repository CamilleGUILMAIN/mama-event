class EventController < ApplicationController
  def new
    @event = Event.new
    raise!
  end

  def create
    @event = Event.new(event_params)
    @event.date = Date.parse(params[:events][:date])
    if @event.save
      redirect_to events_path
    else
      render "event/new",status: :unprocessable_entity
    end
  end

  def index
    @events = Event.all
  end

  def show
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :date)
  end

end
