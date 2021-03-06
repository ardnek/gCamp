class AuthenticationController < PublicController

  # def new
  #   binding.pry
  # end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirect_to projects_path
      redirect_to_previous_url_or_project
    else
      @sign_in_error = "Username/password combination is invalid"
      render :new
    end
  end

  def destroy
    # session[:id] = nil
    session.clear
    redirect_to root_path, notice: "Have a nice day!"
  end

end
