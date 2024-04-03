class AlbumsController < ApplicationController
  def index
    @channel = Channel.find(session[:channel_id])
    @albums = @channel.albums.order(created_at: :desc)
  end

  def new
    @channel = Channel.find(session[:channel_id])
    @album = Album.new
  end

  def create
    @channel = Channel.find(session[:channel_id])
    @album = Album.new(album_params)

    if @album.save
      redirect_to channel_albums_path(@channel)
    else
      @channel = Channel.find(session[:channel_id])
      render :new 
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, {album_images: []}).merge(channel_id: @channel.id)
  end
end
