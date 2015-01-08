class UsersController < ApplicationController

  def index
    @users=User.all
  end

  def new
    @user = User.new
  end

  def create
    users_param=params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :pivotal_tracker_token)
    @user=User.new(users_param)
    if @user.save
      redirect_to users_path, notice: "User was successfully created."
    else
      render :new
    end
  end

  def edit
    if current_user == @user
      @user = User.find(params[:id])
    else
      render file: 'public/404', status: :not_found, layout: false
    end
  end

  def update
    users_param=params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :pivotal_tracker_token)
    @user=User.find(params[:id])
    if @user.update(users_param)
      redirect_to users_path, notice: "User was successfully updated."
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
      redirect_to users_path, notice: "User was successfully deleted."
    end
  end


end
