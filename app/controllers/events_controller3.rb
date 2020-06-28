
class EventsController < ApplicationController
  before_action :require_signin, except: %i[index show]
  before_action :require_admin, except: %i[index show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all.send(events_filter)
  end

  def show
   
    @likers = @event.likers
    @categories = @event.categories
    @like = current_user.likes.find_by(event_id: @event.id) if current_user
  end

  def edit
    
  end

  def update
     
    event_params = get_event_params
    @event.update(event_params)
    if @event.save
      # flash[:notice] = "event successfully updated!"
      redirect_to @event, notice: 'Event successfully updated!'
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(get_event_params)
    if @event.save
      redirect_to @event, notice: 'Event successfully created!'
    else
      render :new
    end
  end

  def destroy
    Event.find(params[:id]).delete
    redirect_to events_url
  end

  private

  def set_event
    @event = Event.find_by!(slug: params[:id])
  end

  def get_event_params
    params.require(:event)
          .permit(:name, :description, :location, :price, :starts_at, :capacity, :main_image, category_ids: [])
  end

  def events_filter
    if params[:filter].in? ["upcoming","recent", "past", "free"]#.index(params[:filter])
      #@events = Event.send(params[:filter])
      params[:filter]
    else
     # @events = Event.upcoming
     :recent
    end
  end
end
