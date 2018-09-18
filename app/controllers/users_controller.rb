class UsersController < ApplicationController
  before_action :authenticate_user!

  # Get all Users
  def index
    @users = User.all
    render json: @users, status: 200, each_serializer: UserSerializer
  end

  # Get a single User
  def show
    if params[:id]
      @user = User.find(params[:id].to_i)
      render json: @user
    else
      render json: { error: 'Invalid User ID' }, status: 400
    end
  end

  # Delete User
  def destroy
    if params[:id]
      @user = User.find(params[:id].to_i).destroy
      render json: { success: "User destroyed" }, status: 204
    else
      render json: { error: 'Invalid User ID' }, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
