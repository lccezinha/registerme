class StudentsController < ApplicationController

  def index
    @students = Student.all
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

  # def edit
  # end

  private

  def student_params
    params.require(:student).permit(:name, :register_number)
  end

end
