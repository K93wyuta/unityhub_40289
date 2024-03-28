class UsersController < ApplicationController
  def show
    @channel = Channel.find(params[:id])
    @user = User.find(params[:id])
  end
end
