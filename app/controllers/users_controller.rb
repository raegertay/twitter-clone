class UsersController < ApplicationController

  def update_avatar
    if user_avatar_params[:avatar_url] == current_user.avatar_url
      flash[:alert] = "Please choose a photo first"
    elsif current_user.update(user_avatar_params)
      flash[:notice] = 'Avatar updated succesfully'
    else
      flash[:alert] = "Avatar upload failed"
    end
    redirect_to root_path
  end

  private

  def user_avatar_params
    params.require(:user).permit(:avatar_url)
  end

end
