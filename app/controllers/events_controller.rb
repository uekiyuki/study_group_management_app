class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit create update destroy]

  def index
    # @events = Event.all
    @search = if params[:tag]
                Event.tagged_with(params[:tag]).ransack(params[:q])
              else
                Event.ransack(params[:q])
              end
    @events = @search.result(distinct: true).order_desc.page(params[:page])
  end

  def show
    # @participant = current_user.participants.find_by(event_id: @event.id) if user_signed_in?
    # @favorite = current_user.favorites.find_by(event_id: @event.id) if user_signed_in?
    @comments = @event.comments.includes(:user).order_desc

    @comment = @event.comments.build
  end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = current_user.events.build(event_params)
    @event.tag_list.add(params[:event][:tag_list])

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    @event.tag_list.clear
    @event.tag_list.add(params[:event][:tag_list])

    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :content, :event_at, :image, :tag_list, :location, :price)
  end
end
