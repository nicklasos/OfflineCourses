class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_owner, :only => [:edit, :update, :destroy]

  def show
    @event = Event.find(params[:id])
    @course = Course.find(params[:course_id])
  end

  def edit
    @event = Event.find(params[:id])
    @course = Course.find(params[:course_id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to course_event_path(params[:course_id], @event)
    else
      render action: "edit"
    end
  end

  def new
    @course = Course.find(params[:course_id])
    @event = @course.events.build
  end

  def create
    @course = Course.find(params[:course_id])
    @event = @course.events.build(params[:event])

    if @event.save
      redirect_to course_event_path(@course, @event), notice: "New event created!"
    else
      redirect_to course_path(@course)
    end

  end

  def go
    @event = Event.find(params[:id])
    @event.users << current_user
    redirect_to course_event_path(params[:course_id], @event)
  end

  def pass
    Visitor.destroy_all(user_id: current_user.id, event_id: params[:id])
    redirect_to course_event_path(params[:course_id], params[:id])
  end

  private

  def check_owner
    @course = Course.find(params[:course_id])

    if (current_user.id != @course.admin.id)
      render :nothing => true, :status => :unauthorized # 401
    end
  end
end
