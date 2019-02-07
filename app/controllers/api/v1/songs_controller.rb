class Api::V1::SongsController < ApplicationController
  before_action :find_song, only: [:show, :update, :destroy]
  
  def index
    @songs = Song.all
    render json: @songs, status: 200
  end

  def show
    render json: @song, status: 200
  end

  def create
    @song = Song.create(song_params)
    render json: @song, status: 200
  end

  def update
    @song.update(song_params)
    render json: @song, status: 200
  end

  def destroy
    @song.delete
    render json: { songId: @song.id }
  end

  private

    def song_params
      params.require(:song).permit(:title)
    end

    def find_song
      @song = Song.find(params[:id])
    end

end
