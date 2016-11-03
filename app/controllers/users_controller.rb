class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end

    end

    def login
        @user = User.find_by(params[:email]).try(:authenticate, params[:password])
        if @user
            render json: @user
        else
            render json:["Incorrect credentials"], status: :unauthorized
        end
    end

    private

    def user_params
      params.permit(:name, :email, :password, :file)
    end
end
