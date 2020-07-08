# frozen_string_literal: true

class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new
    @member = Member.new
end

  def create
    @member = Member.new(member_params)

    @member.save

    #   # store the data coming from the form into rails session names movies
    #   if session[:songs] == nil
    #     session[:songs] = []
    # end
    # session[:songs].push(params[:song])
    # # redirect to the index html page
    redirect_to members_path
  end

  def member_params
    params.require(:member).permit(:name)
  end
end
