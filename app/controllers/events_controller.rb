class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.open.newer
  end

  def show
    @comment = Comment.new
    @favorite = current_user.favorites.find_by(event_id: @event) if user_signed_in?
    @participant = current_user.participants.find_by(event_id: @event) if user_signed_in?
  end

  def new
    @group_id = params[:group_id]
    @event = Event.new
    @event.participants.build
    @cities = City.where(prefecture_id: params[:prefecture_id])
    if request.xhr?
      render json: {cities: @cities}
    end
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
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

  def integrate_datetime(params)
    params.require(:event)[:start_time] = params.require(:event)[:start_time]+" "+params[:event]["start_time_hour(4i)"]+":"+params[:event]["start_time_hour(5i)"]
  end

  def event_params
    integrate_datetime(params)
    params.require(:event).permit(:title, :sport, :location, :status, :start_time, :end_time, :fixed_number, :information, :deadline, :fee, :theme_list, :group_id, :prefecture_id, :city_id, participants_attributes: [:id, :event_id, :user_id])
  end
end
