class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end


  def index
    @membership = Membership.new
    @memberships = Membership.all
    #@memberships = @project.memberships
  end

  #def new
    #@membership = @project.membership.new
  #end

  def create
      @membership = @project.memberships.new(membership_params)
        if @membership.save
        redirect_to project_memberships_path, notice: 'Membership was successfully created.'
        end
      end

  def edit
    @membership = Membership.find(params[:id])
  end


  def update
    @membership = Membership.find(params[:id])
        if @membership.update(membership_params)
          redirect_to project_memberships_path, notice: 'Membership was successfully updated.'
        else
          render :index
      end
    end


  def destroy
    membership = Membership.find(params[:id])
    membership.destroy
      redirect_to project_memberships_path, notice:  "Membership was successfully removed."
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  #def set_task
   #@membership = @project.memberships.find(params[:id])
  #end

  # Never trust parameters from the scary internet, only allow the white list through.
  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
    #params.require(:membership).permit(:user_id, :title).merge(:project_id => params[:project_id])
  end

end
