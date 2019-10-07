class HeartsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  skip_before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @heart = Heart.find_by(post: @post, user: current_user)
    if @heart.nil?
      @heart = Heart.new(post: @post, user: current_user)
      # authorize @heart
      @heart.save
    else
      flash[:notice] = 'You have already liked this post.'
    end
    redirect_to post_path(@post)
  end

  def destroy
    @heart = Heart.find_by(post: @post, user: current_user)
    if @heart.nil?
      flash[:notice] = 'You have already unliked this review.'
    else
      # authorize @heart
      @heart.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id]) unless params[:post_id].nil?
    @post = Post.find(params[:id]) unless params[:id].nil?
  end
end
