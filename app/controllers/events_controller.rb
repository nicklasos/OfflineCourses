class EventsController < ApplicationController
  def index
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
end
