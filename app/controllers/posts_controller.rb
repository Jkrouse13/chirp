class PostsController < ApplicationController

  before_action :require_logged_in, only: [:create, :index]

  def create
    @post = Post.new(post_params)
    if current_user.posts << @post
      render json: @post
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def show_all
    @posts = Post.all.order("created_at DESC")
    render json: @posts
  end

  def index
    @posts = Post.timeline(current_user)
    render json: @posts
  end


  private

  def post_params
    params.permit(:chirp, :file)
  end

end
