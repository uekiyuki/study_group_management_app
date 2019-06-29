class ParticipantsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    if @event.participants.count >= @event.capacity
      redirect_to event_path(@event), notice: '定員オーバーのため参加できません'
    elsif current_user.participants.create(event_id: @event.id)
      redirect_to event_path(@event), notice: '勉強会の参加登録が完了しました'
    else
      redirect_to event_path(@event), notice: '勉強会の参加登録ができませんでした。開催者にコメントをお願いします。'
    end
  end

  def destroy
    @participant = Participant.find(params[:id])
    if @participant.destroy
      redirect_to event_path(@participant.event_id), notice: '勉強会の参加をキャンセルしました'
    else
      redirect_to event_path(@participant.event_id), notice: '勉強会の参加をキャンセルできませんでした'
    end
  end
end
