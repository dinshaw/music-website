class SongsController < ApplicationController
  def index
  end

  def create
    @song = Song.new song_params
    if @song.save
      flash[:success] = 'Song created!'
      redirect_to @song
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def update
  end

  def edit
  end

  def show
    @song = Song.find params[:id]
  end

  private
  def song_params
    params.require(:song).permit(:title, :description)
  end
end
