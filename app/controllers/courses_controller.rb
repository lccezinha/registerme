class CoursesController < ApplicationController
  before_action :load_course, only: [:edit, :show, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def edit
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params

    if @course.save
      flash[:notice] = t('controllers.courses.flash.create.notice')
      redirect_to courses_path
    else
      render action: :new
    end
  end

  def update
    if @course.update(course_params)
      flash[:notice] = t('controllers.courses.flash.edit.notice')
      redirect_to course_path(@course)
    else
      render action: :edit
    end
  end

  def destroy
    @course.destroy
    flash[:notice] = t('controllers.courses.flash.destroy.notice')
    redirect_to courses_path
  end

  private

  def load_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit(:name, :description)
  end

end
