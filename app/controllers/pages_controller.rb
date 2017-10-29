class PagesController < ApplicationController

  before_action :authenticate_user!

  def home
    @user = params[:id] ? User.find(params[:id]) : current_user
    @tweets = @user == current_user ? @user.mixed_tweets : @user.tweets
  end

  def following
    @user = params[:id] ? User.find(params[:id]) : current_user
    @followings = @user.followings.order(created_at: :desc)
  end

  def follower
    @user = params[:id] ? User.find(params[:id]) : current_user
    @followers = @user.followers.order(created_at: :desc)
  end

  def tweets_by_tag
    @tag = Tag.find(params[:id])
    @tweets = @tag.tweets.order(created_at: :desc)
  end

  def my_tweets
    @tweets = current_user.tweets.order(created_at: :desc)
  end

end
