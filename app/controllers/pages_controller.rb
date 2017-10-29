class PagesController < ApplicationController

  before_action :authenticate_user!

  def home; end

  def following; end

  def follower; end

  def tweets_by_tag
    @tag = Tag.find(params[:id])
    @tweets = @tag.tweets.order(created_at: :desc)
  end

  def tweets_by_user
    @tweets = User.find(params[:id]).tweets.order(created_at: :desc)
  end

end
