class CommentsController < ApplicationController
  before_action :set_post, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:create, :destroy]

  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to post_path(@comment.post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id]) unless params[:post_id].nil?
    @post = Post.find(params[:id]) unless params[:id].nil?
  end

  def comment_params
    params.required(:comment).permit(:content)
  end
end
