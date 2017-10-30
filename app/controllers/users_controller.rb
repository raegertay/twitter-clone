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
    following_id = params[:id]
    @followship = current_user.followships.build(following_id: following_id)
    @followship.save
    flash[:notice] = 'Following ' + User.find(following_id).username + ' now'
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    unfollow_user = User.find(params[:id])
    current_user.followings.destroy(unfollow_user)
    flash[:notice] = 'Unfollowed ' + unfollow_user.username
    redirect_back(fallback_location: root_path)
  end

  private

  def avatar_url
    params.require(:avatar_url)
  end

end
