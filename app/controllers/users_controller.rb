class UsersController < ApplicationController
  # Get all Users
  def index
    users = User.all
    render json: users
  end

  # Get a single User
  def show
    if params[:id]
      user = User.find(params[:id].to_i)
      render json: user
    else
      render json: { error: 'Invalid User ID' }, status: 400
    end
  end

  # Create new User
  def create
    user = User.new(email: params[:email], password: params[:password])
    # user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
