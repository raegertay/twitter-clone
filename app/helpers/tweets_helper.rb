module TweetsHelper

  def tagify_tweet(tweet)
    tags = tweet.tags
    tagified_tweet = tweet.body
    tags.each do |tag|
      tagified_tweet.gsub!(tag.body, link_to(tag.body, tweets_by_tag_path(tag)) )
    end
    tagified_tweet.html_safe
  end

end
