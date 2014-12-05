class MembershipsController < ApplicationController

  def new
    @membership = Membership.new
  end

  # def create
  #   @membership = Membership.new membership_params
  # end

  private

  def membership_params
    params.require(:membership).permit(:student_id, :course_id)
  end

end
