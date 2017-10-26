class UsersController < ApplicationController

  def update_avatar
    if current_user.update(user_avatar_params)
      flash[:notice] = 'Tasklist updated succesfully'
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
