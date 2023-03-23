class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new_invitation
    user = User.find(params[:id])
    current_user.send_invitation(user)
    redirect_to user_path(user)
  end
end