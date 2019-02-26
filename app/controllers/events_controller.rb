class EventsController < ApplicationController
before_action :set_event, only: %i[show new edit update destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
  end

  def edit
  end

  def update
    @event.update(events_params)
    redirect_to event_path
  end

  def create
    @event = Event.new(events_params)
    @event.user = current_user
    if @event.save!
      redirect_to event_path
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to event_path
  end

  private

  def set_events
    @event = Event.find(params[:id])
  end

  def events_params
    params.require(:event).permit(:title, :text, :date_start, :date_end)
  end
end

