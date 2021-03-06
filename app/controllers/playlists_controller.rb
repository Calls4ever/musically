class PlaylistsController < ApplicationController
    before_action :find_playlist, only: [:show, :update, :edit, :destroy]

    def index
        @playlists = Playlist.all
    end

    def show
        
    end

    def edit
        @songs = Song.all
    end

    def update
        
        @song = Song.find(params[:playlist][:songs])
        @playlist.songs << @song
        redirect_to playlist_path(@playlist)
    end

    def new
        @playlist = Playlist.new

    end

    def create
        @playlist = Playlist.create(playlist_params)
        redirect_to playlists_path
    end

    def destroy
        @playlist.destroy
        redirect_to playlists_path
    end

    private

    def playlist_params
        params.require(:playlist).permit(:title, :user_id)
    end

    def find_playlist
        @playlist = Playlist.find(params[:id])
    end
end
