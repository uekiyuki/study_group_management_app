class ParticipantsController < ApplicationController
  def create
    current_user.participants.create(event_id: params[:event_id])
    redirect_to event_path(params[:event_id]), notice: '勉強会の参加登録が完了しました'
  end

  def destroy
    @participant = Participant.find(params[:id]).destroy
    redirect_to event_path(@participant.event_id), notice: '勉強会の参加をキャンセルしました'
  end
end
