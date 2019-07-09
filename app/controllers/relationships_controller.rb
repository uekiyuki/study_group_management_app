class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js

  def create
    @user = User.find(params[:followed_id])
    current_user.active_relationships.create(followed_id: @user.id)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    Relationship.find(params[:id]).destroy
  end
end
