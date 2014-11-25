class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end


  def index
    @membership = Membership.new
    #@memberships = Membership.all
    #@memberships = @project.memberships
  end

  #def new
    #@membership = @project.membership.new
  #end

  def create
      @membership = @project.memberships.new(membership_params)
        if @membership.save
        redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully created."
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
    params.require(:membership).permit(:user_id, :role)
    #params.require(:membership).permit(:user_id, :title).merge(:project_id => params[:project_id])
  end

end
