class TweetsController < ApplicationController

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      @tags = @tweet.scan_tags
      @tags.each do |tag|
        if Tag.exists?(body: tag)
          tag_id = Tag.find_by(body: tag).id
          @tweet.tweet_tags.create(tag_id: tag_id)
        else
          @tweet.tags.create(body: tag)
        end
      end
      respond_to do |format|
        format.js
      end
    else
      render 'pages/home'
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
