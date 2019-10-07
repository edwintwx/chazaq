class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :edit]

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @posts = Post.where(user: params[:id])
    else
      flash[:notice] = 'Sorry! This user does not exist.'
      redirect_to root_path
    end
  end

  def edit

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:first_name, :last_name, :description, :email, :avatar)
  end
end
