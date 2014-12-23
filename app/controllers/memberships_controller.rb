class MembershipsController < ApplicationController

  #always need a project so add the before action with project_id found in rake routes:

  before_action do
    @project = Project.find(params[:project_id])
  end

  before_action :authorize_member


  def index
    @membership = Membership.new
    @memberships = @project.memberships

    #@memberships = Membership.all
  end

  #def new
  #@membership = @project.membership.new
  #end

  def create
    #@membership = @project.memberships.new(membership_params)-- create a new member and associate it with projects -- NO!
    @membership = Membership.new(membership_params)
    @membership.project = @project
    if @membership.save
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was added successfully."
    else
      @memberships = @project.memberships
      render :index
    end
  end

  def update
    @membership = Membership.find(params[:id])
    @membership.update(membership_params)
    redirect_to project_memberships_path, notice: "#{@membership.user.full_name} was updated successfully."
  end


  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to project_memberships_path, notice: "#{@membership.user.full_name} was removed successfully."
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  # Never trust parameters from the scary internet, only allow the white list through.
  def membership_params
    params.require(:membership).permit(:user_id, :project_id, :role)
    #params.require(:membership).permit(:user_id, :title).merge(:project_id => params[:project_id])
  end

  def authorize_member
    unless current_user_member?
      render file: 'public/404', status: :not_found, layout: false
    end
  end

  # def current_user_has_membership?
  #   @membership.user.id == current_user.id
  # end

end
