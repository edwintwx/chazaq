class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :edit, :followers, :following]

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @posts = Post.where(user: params[:id]).order("created_at DESC").paginate(page: params[:page])
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

  def followers
    @user = User.find(params[:user_id])
    @followers = @user.user_followers.paginate(page: params[:page])
  end

  def following
     @user = User.find(params[:user_id])
    @following = @user.following_users.paginate(page: params[:page])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:first_name, :last_name, :bio, :email, :avatar)
  end
end
