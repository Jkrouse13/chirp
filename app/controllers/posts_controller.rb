class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity
    end
  end

  def self.timeline(user)
   following_ids = user.followees.pluck(:id)
   all_ids= following_ids << user.id
   Post.where(user_id: all_ids).order("created_at DESC")
  end

  private

  def post_params
    params.permit(:chirp, :file)
  end

end
