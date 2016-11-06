class UsersController < ApplicationController

    before_action :require_logged_in, only: [:follow_user, :unfollow_user, :show, :my_chirps]

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end

    end

    def login
        @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
        if @user
            render json: @user
        else
            render json:["Incorrect credentials"], status: :unauthorized
        end
    end

    def my_chirps
        @posts = @current_user.posts.order("created_at DESC")
        render json: @posts
    end

    def index
        @users = User.all.order("created_at DESC")
        render json: @users
    end

    def follow_user
        @current_user.follow!(User.find(params[:id]))
        render json: @current_user
    end

    def unfollow_user
        @current_user.unfollow!(User.find(params[:id]))
        render json: @current_user
    end

    def all_followers
        @followers = User.find(params[:id]).followers(User)
        render json: @followers
    end

    def all_followees
        @followees = current_user.followees(User)
        render json: @followees
    end

    def practice_counting
        @user = User.find(params[:id])
        @user.followers_count
        render json: @user
    end

    def show
        @user = current_user
        render json: @user
    end


    private

    def user_params
      params.permit(:name, :email, :password, :file)
    end

end
