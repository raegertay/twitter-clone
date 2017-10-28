class PagesController < ApplicationController

  before_action :authenticate_user!

  def home; end

  def following; end

  def follower; end

  def tweets_by_tag
    @tweets = Tag.find(params[:id]).tweets.order(created_at: :desc)
  end

end
