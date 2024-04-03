class AlbumsController < ApplicationController
  def index
    @channel = Channel.find(session[:channel_id])
    if params[:search].blank?
      @albums = @channel.albums.order(created_at: :desc)
    else
      @albums = @channel.albums.where('title LIKE ?', "%#{params[:search]}%").order(created_at: :desc)
    end
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

  def show
    @channel = Channel.find(session[:channel_id])
    @album = @channel.albums.find(params[:id])
  end

  def edit
    @channel = Channel.find(session[:channel_id])
    @album = Album.find(params[:id])
  end

  def update
    @channel = Channel.find(session[:channel_id])
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to channel_albums_path(@channel)
    else
      @channel = Channel.find(session[:channel_id])
      render :edit
    end
  end

  def destroy
    @channel = Channel.find(session[:channel_id])
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to channel_albums_path(@channel)
  end


  private

  def album_params
    params.require(:album).permit(:title, {album_images: []}).merge(channel_id: @channel.id)
  end
end
