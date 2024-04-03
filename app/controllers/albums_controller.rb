class AlbumsController < ApplicationController
  def index
    @channel = Channel.find(session[:channel_id])
  end

  def new
    @channel = Channel.find(session[:channel_id])
    @album = Album.new
  end

  def create
    @channel = Channel.find(session[:channel_id])
    @album = Album.new(album_params)

    params[:album][:album_images].each do |image|
      @album.album_images.attach(image)
    end

    if @album.save
      redirect_to channel_albums_path(@channel)
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, {album_images: []}).merge(channel_id: @channel.id)
  end
end
