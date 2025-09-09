class UsersController < ApplicationController
  # show signup form
  def new
    @user = User.new
  end

  # create a user
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id   # log in user automatically after signup
      redirect_to friends_path, notice: "Signed up successfully!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
