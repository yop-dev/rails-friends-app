class FriendsController < ApplicationController
  before_action :require_login
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  def index
    @friends = current_user.friends
  end

  def show
    # @friend is already set by set_friend
  end

  def new
    @friend = current_user.friends.new
  end

  def create
    @friend = current_user.friends.new(friend_params) # assign current_user

    if @friend.save
      redirect_to @friend, notice: "Friend was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    # @friend is already set by set_friend
  end

  def update
    if @friend.update(friend_params)
      redirect_to @friend, notice: "Friend was successfully updated."
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @friend.destroy
    redirect_to friends_path, status: :see_other, notice: "Friend was successfully deleted."
  end

  private

  def set_friend
    # Ensure only current_user can access their own friends
    @friend = current_user.friends.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter, :image)
  end
end
