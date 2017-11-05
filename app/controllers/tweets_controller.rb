class TweetsController < ApplicationController

  def create
    @user = current_user
    @tweet = @user.tweets.build(tweet_params)
    @tweet.save_with_tags
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:notice] = 'Tweet deleted'
    redirect_back(fallback_location: root_path)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
