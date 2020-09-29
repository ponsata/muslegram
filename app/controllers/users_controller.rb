class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show, :edit, :update] 

  def edit
    user = User.find(params[:id])
    @image = user.image
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
  def show
    @user = User.find(params[:id])

  end
  
  private
  
  def user_params
    params.require(:user).permit(:id, :nickname, :email, :image)
  end
  
end
