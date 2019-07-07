class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit create update destroy]

  # GET /events
  # GET /events.json
  def index
    # @events = Event.all
    @search = if params[:tag]
                Event.tagged_with(params[:tag]).ransack(params[:q])
              else
                Event.ransack(params[:q])
              end
    @events = @search.result(distinct: true).order_desc.page(params[:page])
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @participant = current_user.participants.find_by(event_id: @event.id) if current_user.present?

    @comments = @event.comments.includes(:user).order_desc

    @comment = @event.comments.build
  end

  # GET /events/new
  def new
    @chk = []
    respond_to do |format|
      format.html { @event = Event.new }
      format.js do
        render 'create_tag'
      end
    end
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params)
    @event.tag_list.add(params[:event][:tag_list])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
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

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :content, :event_at, :image, :tag_list)
  end
end
