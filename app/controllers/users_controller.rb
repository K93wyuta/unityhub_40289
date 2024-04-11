class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_channel, only: [:show, :edit]

  def show
    session[:channel_id] = @channel.id
  end

  def edit
  end

  def update
    if @user.update_without_password(user_params)
      bypass_sign_in(@user)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_session_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    @channel = Channel.find(session[:channel_id])
    redirect_to channel_path(@channel) unless @user == current_user
  end

  def set_channel
    @channel = Channel.find(session[:channel_id])
  end

  def user_params
    params.require(:user).permit(:profile_image, :background_image, :name, :email, :password, :password_confirmation, :gender_id, :age_id, :birthday, :mbti_id,
                                 :line, :paypay, :profile)
  end
end
