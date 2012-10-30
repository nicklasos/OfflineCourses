class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @course = Course.find(params[:course_id])
  end

  def edit
  end

  def new
    @course = Course.find(params[:course_id])
    @event = @course.events.build
  end

  def create
    
    @course = Course.find(params[:course_id])
    @event = @course.events.build(params[:event])

    if @event.save
      redirect_to course_path(@course), notice: "New event created!"
    else
      redirect_to :root, alert: "Fail"
    end

  end

  def go
    @event = Event.find(params[:id])
    @event.users << current_user
    redirect_to course_event_path(params[:course_id], @event)
  end

  def pass
    Visitor.destroy_all(user_id: current_user.id, event_id: params[:id])
    redirect_to course_path(params[:course_id])
  end
end
