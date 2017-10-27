class TweetsController < ApplicationController

  def create
    @tweet = current_user.tweets.build(tweet_params)
    @tags = @tweet.scan_tags
    if @tweet.save
      respond_to do |format|
        format.js
      end
    else
      render 'pages/home'
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
