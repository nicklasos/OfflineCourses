class CoursesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(params[:course])
    @course.owner_id = current_user.id

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        redirect_to @course, notice: 'Course was successfully updated.'
      else
        render action: "edit"
      end
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_url
  end

  def subscribe
    course = Course.find(params[:id])
    current_user.courses << course
    redirect_to course_path, notice: "You have subscribed for this course"
  end

  def unsubscribe
    Subscription.destroy_all(:user_id => current_user.id, :course_id => params[:id])
    redirect_to course_path, notice: "You have unsabscribed from this course"
  end
end
