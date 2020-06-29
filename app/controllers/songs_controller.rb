class SongsController < ApplicationController

def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def show
        @song = Song.find(params[:id])
    end

    def create
        puts "------------in create--------------"
        @song = Song.new(song_params)
        @song.save
        
            #   # store the data coming from the form into rails session names movies
            #   if session[:songs] == nil
            #     session[:songs] = []
            # end
            # session[:songs].push(params[:song])
            # # redirect to the index html page
            redirect_to songs_path
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        redirect_to songs_path
    end

    def remove
        @song = Song.find(params[:id])
        @song.destroy
     
        redirect_to songs_path
    end

    private
    def song_params
        params.require(:song).permit(:title, :program, :order, :notes, :lyrics, :tempo)
    end
end
