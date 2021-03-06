class PagesController < ApplicationController

  before_action :authenticate_user!
  before_action :prepare_user, only: [:tweets, :following, :follower]
  before_action :prepare_current_user, only: [:home, :tweets_by_tag]
  before_action :prepare_search_term, only: [:search]

  def home
    @tweets = @user.mixed_tweets.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def tweets
    @tweets = @user.tweets.order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
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

  def search
    @users = User.search(@search_term)
    @tweets = Tweet.search(@search_term)
    @tags = Tag.search(@search_term)
  end

  private

  def prepare_user
    @user = params[:username] ? User.find_by(username: params[:username]) : current_user
  end

  def prepare_current_user
    @user = current_user
  end

  def prepare_search_term
    @search_term = params[:search]
  end

end
