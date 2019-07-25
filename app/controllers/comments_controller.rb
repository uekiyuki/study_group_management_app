class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @event = Event.find(params[:event_id])

    # FIXME
    # wanna know better code
    @comment = @event.comments.build(content: params[:comment][:content], user_id: current_user.id)

    # ex1
    # comment_params_to_hash = comment_params.to_hash
    # comment_params_to_hash["event_id"] = @event.id
    # @comment = current_user.comments.build(comment_params_to_hash)

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to event_path(@event), notice: '投稿できません' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:event_id, :content)
  end
end
