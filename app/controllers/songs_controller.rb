# frozen_string_literal: true

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
    new_members = if song_params[:member_ids]
                    song_params[:member_ids].map { |x| Member.find(x) }
                  else
                    []
                   end

    # save the song_params into a variable
    non_members_song_params = song_params

    # remove :members from the new params
    non_members_song_params.delete(:members)

    # create the song
    @song = Song.new(non_members_song_params)

    # create the link of each member to the new song
    new_members.each do |member|
      @song.members << member
    end

    @song.save

    redirect_to songs_path
  end

  def edit
    @song = Song.find(params[:id])
    @members = Member.all
    @song.member_ids = @song.members.all.map(&:id)
  end

  def update
    @song = Song.find(params[:id])

    # map the strings in the params[:members] array to the member objects
    new_members = if song_params[:member_ids]
                    song_params[:member_ids].map { |x| Member.find(x) }
                  else
                    []
                  end
    # save the song_params into a variable
    non_members_song_params = song_params

    # remove :members from the new params
    non_members_song_params.delete(:member_ids)

    # create the link of each member to the new song
    new_members.each do |member|
      @song.members << member unless @song.members.include?(member)
    end
    @song.members.each do |current_member|
      unless new_members.include?(current_member)
        @song.members.delete(current_member)
        end
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
    params.require(:song).permit(:title, :program, :order, :notes, :lyrics, :tempo, member_ids: [])
  end
end
