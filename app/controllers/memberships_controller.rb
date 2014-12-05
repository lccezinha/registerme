class MembershipsController < ApplicationController

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new membership_params

    if @membership.save
      flash[:notice] = t('controllers.membership.flash.create.notice')
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:student_id, :course_id)
  end

end
