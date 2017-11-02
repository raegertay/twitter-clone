class Tweet < ApplicationRecord

  belongs_to :user
  has_many :tweet_tags, dependent: :destroy
  has_many :tags, through: :tweet_tags

  validates :body, presence: true, length: { maximum: 140 }

  include PgSearch
  pg_search_scope :search,
                  against: :body,
                  using: :trigram

  MAX_WORD_COUNT = 140

  # Return all tags in tweet in array format
  def scan_tags
    self.body.scan(/#\w+/).uniq
  end

end
