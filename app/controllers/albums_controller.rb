class AlbumsController < ApplicationController
  before_action :set_channel, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = if params[:search].blank?
                @channel.albums.order(created_at: :desc)
              else
                @channel.albums.where('title LIKE ?', "%#{params[:search]}%").order(created_at: :desc)
              end
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to channel_albums_path(@channel)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to channel_albums_path(@channel)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album.destroy
    redirect_to channel_albums_path(@channel)
  end

  private

  def set_channel
    @channel = Channel.find(session[:channel_id])
  end

  def set_album
    @album = @channel.albums.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, { album_images: [] }).merge(channel_id: @channel.id)
  end
end
