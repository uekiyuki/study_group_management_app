class ParticipantsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    if @event.participants.count >= @event.capacity
      redirect_to event_path(@event), notice: '定員オーバーのため参加できません'
    else
      current_user.participants.create(event_id: @event.id)
      redirect_to event_path(@event), notice: '勉強会の参加登録が完了しました'
    end
  end

  def destroy
    @participant = Participant.find(params[:id]).destroy
    redirect_to event_path(@participant.event_id), notice: '勉強会の参加をキャンセルしました'
  end
end
