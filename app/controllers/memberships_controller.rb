class MembershipsController < ApplicationController
  before_action :load_resources, only: :new

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new membership_params

    if @membership.save
      flash[:notice] = t('controllers.membership.flash.create.notice')
      redirect_to student_path(@membership.student)
    else
      render :new
    end
  end

  def avaliables
    student     = Student.includes(:courses).find params[:id]
    courses_ids = student.courses.pluck :id
    avaliables  = Course.where.not id: courses_ids
    render json: avaliables
  end

  private

  def membership_params
    params.require(:membership).permit(:student_id, :course_id)
  end

  def load_resources
    @students = Student.all
    @courses  = Course.all
  end
end
