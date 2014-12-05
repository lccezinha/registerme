class StudentsController < ApplicationController
  before_action :load_student, only: [:edit, :show, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def edit
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new student_params

    if @student.save
      flash[:notice] = t('controllers.students.flash.create.notice')
      redirect_to students_path
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      flash[:notice] = t('controllers.students.flash.edit.notice')
      redirect_to student_path(@student)
    else
      render action: :edit
    end
  end

  def destroy
    @student.destroy
    flash[:notice] = t('controllers.students.flash.destroy.notice')
    redirect_to students_path
  end

  private

  def load_student
    @student = Student.find params[:id]
  end

  def student_params
    params.require(:student).permit(:name, :register_number)
  end

end
