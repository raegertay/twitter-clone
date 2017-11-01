class UsersController < ApplicationController

  before_action :prepare_user
  before_action :prepare_followee, only: [:follow, :unfollow]

  def update_avatar
    @user.update(avatar_url: avatar_url)
    flash[:notice] = 'Avatar updated succesfully'
    redirect_back(fallback_location: root_path)
  end

  def follow
    @user.follow(@followee)
    flash[:notice] = 'Following ' + @followee.username + ' now'
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    @user.unfollow(@followee)
    flash[:notice] = 'Unfollowed ' + @followee.username
    redirect_back(fallback_location: root_path)
  end

  private

  def prepare_user
    @user = current_user
  end

  def prepare_followee
    @followee = User.find(params[:id])
  end

  def avatar_url
    params.require(:avatar_url)
  end

end
