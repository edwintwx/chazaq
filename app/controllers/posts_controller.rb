class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(review_params)
    @post.user = current_user
    @post.save
    if !params[:post][:photo_url].nil?
      params[:post][:photo_url].each do |photo|
       PostPhoto.create(photo: photo, post: @post)
      end
    end

    redirect_to post_path(@post)
  end

  def edit

  end

  def update
    @post.update(review_params)
    redirect_to @post
  end

  def destroy
    photos = @post.post_photos
    if photos.count.positive?
      photos.each do |p|
        p.destroy
      end
    end
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def review_params
    params.required(:post).permit(:content, :request, :testimonial)
  end
end
