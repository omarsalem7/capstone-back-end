class UsersController < ApplicationController
  # before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  def authenticate
    valid = User.find_by(email: params[:email]).valid_password(password: params[:password])
    if valid
      @user = User.find_by(email: params[:email])
      @user.api_token = Devise.friendly_token.to_s
      @user.save
      respond_to do |format|
        format.json { render json: @user.api_token, status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: 'Incorrect email or password'.to_json, status: :ok }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end
end
