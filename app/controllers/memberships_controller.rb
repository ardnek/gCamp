class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end


  def index
    @memberships = Membership.all
    @membership = Membership.new
  end

  def new
    @membership = @project.membership.new
  end

  def create
    @membership = @project.membership.new(membership_params)
    @membership.save
    redirect_to project_path(@project)
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
   @membership = @project.memberships.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

end
