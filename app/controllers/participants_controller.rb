class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js

  def create
    @event = Event.find(params[:event_id])
    redirect_to event_path(@event), notice: '定員オーバーのため参加できません' if @event.participants.count >= @event.capacity
    current_user.participants.create(event_id: @event.id)
  end

  def destroy
    @participant = Participant.find(params[:id])
    @event = @participant.event
    @participant.destroy
  end
end
