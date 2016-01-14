class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @comment = Comment.new
    @favorite = current_user.favorites.find_by(event_id: @event) if user_signed_in?
    @participant = current_user.participants.find_by(event_id: @event) if user_signed_in?
  end

  def new
    @event = Event.new
    @event.participants.build
  end

  def create
    @event = current_user.events.create(event_params)

    # if @event.save
       redirect_to @event, notice: 'Event was successfully created.'
    # else
    #   render :new
    # end
  end

  def edit
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
      params[:event].permit(:title, :sport, :location, :fixed_number, :information, :theme_list, participants_attributes: [:id, :event_id, :user_id])
    end
end
