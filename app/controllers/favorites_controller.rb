class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @event = Event.find(params[:event_id])
    if current_user.favorites.create(event_id: @event.id)
      redirect_to event_path(@event), notice: 'ストックしました'
    else
      redirect_to event_path(@event), notice: 'ストックできませんでした'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      redirect_to event_path(@favorite.event_id), notice: 'ストックから削除しました'
    else
      redirect_to event_path(@favorite.event_id), notice: 'ストックから削除できませんでした'
    end
  end
end
