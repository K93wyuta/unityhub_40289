class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @channel = Channel.find(session[:channel_id])
    session[:channel_id] = @channel.id
  end

  def edit
    @user = User.find(params[:id])
    @channel = Channel.find(session[:channel_id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_without_password(user_params)
      bypass_sign_in(@user)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to new_user_session_path
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :background_image, :name,:email, :password, :password_confirmation, :gender_id, :age_id, :birthday, :mbti_id,
    :line, :paypay, :profile)
  end
end