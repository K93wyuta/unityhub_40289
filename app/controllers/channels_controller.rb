class ChannelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_channel_user, only: [:show, :edit, :update, :destroy]

  def index
    @channels = current_user.channels.includes(:channel_users)
    @identification = params[:identification]
    @password = params[:password]
  end

  def new
    @channel = Channel.new
    @users = User.all
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      (params[:administrators] || []).each do |administrator_id|
        @channel.channel_users.create(user_id: administrator_id, administrator: true)
      end
      (params[:users] || []).each do |user_id|
        unless @channel.channel_users.where(user_id:, administrator: true).exists?
          @channel.channel_users.create(user_id:, administrator: false)
        end
      end
      redirect_to channels_path
    else
      @users = User.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    session[:channel_id] = @channel.id
    @administrators = @channel.administrators
    @channel_users = @channel.channel_users
    @events = @channel.events.where('date_end >= ?', Date.today).order(created_at: :desc)
    @topics = @channel.topics.order(created_at: :desc)
  end

  def edit
    @users = User.all
    return if @channel.administrators.include?(current_user)

    redirect_to channel_path(@channel), alert: 'あなたはこのチャンネルの管理者ではありません。'
  end

  def update
    if @channel.update(channel_params)
      (params[:administrators] || []).each do |administrator_id|
        @channel.channel_users.find_or_create_by(user_id: administrator_id, administrator: true)
      end
      (params[:users] || []).each do |user_id|
        unless @channel.channel_users.where(user_id:, administrator: true).exists?
          @channel.channel_users.find_or_create_by(user_id:, administrator: false)
        end
      end
      redirect_to channel_path(params[:id])
    else
      @users = User.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @channel.destroy
    redirect_to root_path
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end

  def ensure_correct_channel_user
    return if @channel.channel_users.exists?(user_id: current_user.id)

    redirect_to root_path
  end

  def channel_params
    params.require(:channel).permit(:channel_main_image, :name, :identification, :password, :password_confirmation, :channel_background_image,
                                    :introduction)
  end
end
