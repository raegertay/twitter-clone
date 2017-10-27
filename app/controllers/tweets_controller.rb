class TweetsController < ApplicationController

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      @tags = @tweet.scan_tags
      @tags.each do |tag|
        @tweet.tags.create(body: tag)
      end
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
