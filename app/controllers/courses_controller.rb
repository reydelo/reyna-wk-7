class CoursesController < ApplicationController

  def new
    @course = Course.new
    @user = User.find(params[:user_id])
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = params[:user_id]
    if @course.save
      redirect_to user_courses_path
    else
      render @user
    end
  end

  def index
    @user = User.find(params[:user_id])
    @courses = @user.courses
  end

  def destroy
    @course = Course.find(params[:id])
    @user = User.find(params[:user_id])
    if @course.destroy
      redirect_to user_courses_path
    end
  end

  def show
    @course = Course.find(params[:id])
    @user = User.find(params[:user_id])
  end

  private
  def course_params
    params.require(:course).permit(:title, :day, :night, :user_id)
  end

end
