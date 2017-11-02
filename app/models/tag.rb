class Tag < ApplicationRecord

  has_many :tweet_tags, dependent: :destroy
  has_many :tweets, through: :tweet_tags

  validates :body, presence: true, uniqueness: true

  include PgSearch
  pg_search_scope :search,
                  against: :body,
                  using: { trigram: { threshold: 0.1 } } 

  # Return the top 10 tags with the most number of tweets
  def self.top_10
    tag_ids = TweetTag.group(:tag_id).order('count_all desc').limit(10).count.keys
    self.find(tag_ids)
  end

end
