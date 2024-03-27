class ChannelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @channels = current_user.channels.includes(:channel_users).where(channel_users: { administrator: false })
    @identification = params[:identification]
    @password = params[:password]
  end

  def new
    @channel = Channel.new
    @administrators = User.all
    @users = User.all
  end
  
  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      (params[:administrators]||[]).each do |administrator_id|
        @channel.channel_users.create(user_id:administrator_id, administrator:true)
      end
      (params[:users]||[]).each do |user_id|
        @channel.channel_users.create(user_id:user_id,administrator:false)
      end
      redirect_to channels_path, notice:"Channel was successfully created."
    else
      @administrators = User.all
      @users = User.all
      render :new
    end
  end

  def show
    @channel = Channel.find(params[:id])
  end

  private
  def channel_params
    params.require(:channel).permit(:channel_main_image, :name, :identification, :password, :channel_background_image, :introduction)
  end
end
