class UsersController < ApplicationController

  before_action :check_user, only: [:edit, :update]

  def index
    @users=User.all
  end

  def new
    @user = User.new
  end

  def create
    users_param=params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :pivotal_tracker_token, :admin)
    @user=User.new(users_param)
    if @user.save
      redirect_to users_path, notice: "#{@user.full_name} was successfully created."
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    users_param=params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :pivotal_tracker_token, :admin)
    @user=User.find(params[:id])
    if @user.update(users_param)
      redirect_to users_path, notice: "#{@user.full_name} was successfully updated."
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user=User.find(params[:id])
    if @user.destroy
      redirect_to users_path, notice: "#{@user.full_name} was successfully deleted."
    end
  end

  private

  def user_params
    if current_user.admin?
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :tracker_token, :admin)
    else
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :tracker_token)
    end
  end

  def check_user
    @user = User.find(params[:id])
    unless current_user == @user || current_user.admin?
      render file: 'public/404', status: :not_found, layout: false
    end
  end

end
