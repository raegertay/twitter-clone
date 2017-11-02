class TweetsController < ApplicationController

  def create
    @tweet = current_user.tweets.build(tweet_params)
    @tweet.save_with_tags
    respond_to do |format|
      format.js
    end
  end

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
