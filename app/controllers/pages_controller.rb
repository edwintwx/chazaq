class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page])
  end
end
