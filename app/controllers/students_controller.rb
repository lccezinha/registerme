class StudentsController < ApplicationController

  # FIXME
  def index
  end

  def new
    @student = Student.new
  end

  private

  def student_params
    params.require(:student).permit(:name, :register_number)
  end

end
