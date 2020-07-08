class SongsController < ApplicationController

def index
        @songs = Song.all
    end

    def new
        @song = Song.new
        @members = Member.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def create
        # map the strings in the params[:members] array to the member objects
        members = song_params[:members].map{|x| Member.find(x)}

        # save the song_params into a variable
        non_members_song_params = song_params

        #remove :members from the new params
        non_members_song_params.delete(:members)

        #create the song
        @song = Song.new(non_members_song_params)

        #create the link of each member to the new song
        members.each do |member|
            @song.members << member
        end

        @song.save
        
            redirect_to songs_path
    end

    def edit
        @song = Song.find(params[:id])
        @members = Member.all
    end

    def update
        @song = Song.find(params[:id])

         # map the strings in the params[:members] array to the member objects
         members = song_params[:members].map{|x| Member.find(x)}

         # save the song_params into a variable
         non_members_song_params = song_params
 
         #remove :members from the new params
         non_members_song_params.delete(:members)
 
         #create the link of each member to the new song
         members.each do |member|
             @song.members << member
         end
        @song.update(non_members_song_params)
        redirect_to songs_path
    end

    def remove
        @song = Song.find(params[:id])
        @song.destroy
     
        redirect_to songs_path
    end

    private
    def song_params
        params.require(:song).permit(:title, :program, :order, :notes, :lyrics, :tempo, :members)
    end
end
