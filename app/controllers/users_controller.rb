class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new_invitation
    user = User.find(params[:id])
    current_user.send_invitation(user)
    redirect_to user_path(user)
  end

  def accept_friend_request
    friend = User.find(params[:id])
    invitation = Invitation.where(user_id: friend.id, friend_id: current_user.id).first
    invitation.update(confirmed: true)
    invitation.save
    redirect_to friends_path
  end

  def decline_friend_request
    friend = User.find(params[:id])
    invitation = Invitation.where(user_id: friend.id, friend_id: current_user.id, confirmed: false).first
    invitation.destroy
    redirect_to friends_path
  end
end