class UsersController < ApplicationController

  def update_avatar
    if avatar_url == current_user.avatar_url
      flash[:alert] = "Please choose a photo first"
    elsif current_user.update(avatar_url: avatar_url)
      flash[:notice] = 'Avatar updated succesfully'
    else
      flash[:alert] = "Avatar upload failed"
    end
    redirect_back(fallback_location: root_path)
  end

  def follow
    @followee = User.find(params[:id])
    @following = current_user.followings.create(followee_id: @followee.id)
    flash[:notice] = 'Following ' + @followee.username + ' now'
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    @followee = User.find(params[:id])
    current_user.followees.destroy(@followee)
    flash[:notice] = 'Unfollowed ' + @followee.username
    redirect_back(fallback_location: root_path)
  end

  private

  def avatar_url
    params.require(:avatar_url)
  end

end
