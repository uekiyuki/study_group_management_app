class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @event = Event.find(params[:event_id])
    current_user.favorites.create(event_id: @event.id)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @event = @favorite.event
    @favorite.destroy
  end
end
