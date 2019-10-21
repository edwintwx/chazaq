class HeartsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  skip_before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @heart = Heart.new(post: @post, user: current_user)
    # authorize @heart
    @heart.save
    render do |format|
      format.js
    end
  end

  def destroy
    @heart = Heart.find_by(post: @post, user: current_user)
    @heart.destroy
    render do |format|
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id]) unless params[:post_id].nil?
    @post = Post.find(params[:id]) unless params[:id].nil?
  end
end
