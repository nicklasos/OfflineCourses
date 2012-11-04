class CoursesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :check_owner, :only => [:edit, :update, :destroy]

  def index
    if params.key? :my
      authenticate_user!
      @courses = current_user.courses
    else
      @courses = Course.all
    end
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

    if @course.save
      current_user.courses << @course
      Subscription.add_admin(current_user, @course)
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render action: "edit"
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
    Subscription.destroy_all(user_id: current_user.id, course_id: params[:id])
    redirect_to course_path, notice: "You have unsabscribed from this course"
  end

  private

  def check_owner
    @course = Course.find(params[:id])

    if (current_user.id != @course.admin.id)
      render :nothing => true, :status => :unauthorized # 401
    end
  end
end
