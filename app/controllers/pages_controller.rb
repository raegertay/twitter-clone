class PagesController < ApplicationController

  before_action :authenticate_user!
  before_action :prepare_user, only: [:tweets, :following, :follower]
  before_action :prepare_current_user, only: [:home, :tweets_by_tag]

  def home
    @tweets = @user.mixed_tweets
  end

  def tweets
    @tweets = @user.tweets.order(created_at: :desc)
  end

  def following
    @followees = @user.followees.order(created_at: :desc)
  end

  def follower
    @followers = @user.followers.order(created_at: :desc)
  end

  def tweets_by_tag
    @tag = Tag.find(params[:id])
    @tweets = @tag.tweets.order(created_at: :desc)
  end

  private

  def prepare_user
    @user = params[:id] ? User.find(params[:id]) : current_user
  end

  def prepare_current_user
    @user = current_user
  end

end
