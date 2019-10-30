class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page])
  end

  def show
    if @post.isPrivate
      if user_signed_in?
        if current_user != @post.user
          flash[:notice] = 'Sorry! You do not have access to view this.'
          redirect_to root_path
        end
      else
        flash[:notice] = 'Sorry! You do not have access to view this.'
        redirect_to root_path
      end
    end
  end

  def new
    @post = Post.new
    @request = params[:type] == "prayer"
    @testimonial = params[:type] == "testimonial"
  end

  def create
    @post = Post.new(post_params)
    @post.request = @post.category == "Prayer"
    @post.testimonial = @post.category == "Testimonial"
    @post.user = current_user
    @post.save
    if !params[:post][:photo_url].nil?
      PostPhoto.create(photo: params[:post][:photo_url][0], post: @post)
    end

    redirect_to post_path(@post)
  end

  def edit

  end

  def update
    @post.update(post_params)
    if !params[:post][:photo_url].nil?
      delete_photos
      PostPhoto.create(photo: params[:post][:photo_url][0], post: @post)
    end
    redirect_to @post
  end

  def destroy
    delete_photos
    @post.destroy
    redirect_to root_path
  end

  private

  def delete_photos
    photos = @post.post_photos
    if photos.count.positive?
      photos.each do |p|
        p.destroy
      end
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.required(:post).permit(:content, :request, :testimonial, :category, :isPrivate)
  end
end
