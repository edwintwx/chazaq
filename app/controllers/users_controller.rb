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

  def update
    @user.update(user_params)
    if !params[:user][:avatar].nil?
      @user.avatar = params[:user][:avatar]
    end
    @user.save
    redirect_to user_path(current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:first_name, :last_name, :bio, :email, :avatar)
  end
end
