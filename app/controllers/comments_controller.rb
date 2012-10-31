class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    params[:comment][:user_id] = current_user.id
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(params[:comment])

    if @comment.save
      redirect_to course_event_path(params[:course_id], @event)
    else
      redirect_to course_event_path(params[:course_id], @event)
    end
  end
end
