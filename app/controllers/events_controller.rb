class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = current_user.events.create(event_params)

    # if @event.save
       redirect_to @event, notice: 'Event was successfully created.'
    # else
    #   render :new
    # end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
      redirect_to events_url, notice: 'Event was successfully destroyed.'
      head :no_content
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params[:event].permit(:id, :title, :sport, :location, :fixed_number, :information)
    end
end
