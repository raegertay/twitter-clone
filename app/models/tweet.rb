class Tweet < ApplicationRecord

  belongs_to :user
  has_many :tweet_tags, dependent: :destroy
  has_many :tags, through: :tweet_tags

  validates :body, presence: true, length: { maximum: 140 }

  include PgSearch
  pg_search_scope :search,
                  against: :body,
                  using: { trigram: { threshold: 0.1 } }

  MAX_WORD_COUNT = 140

  # Return all tags in tweet in array format
  def scan_tags
    self.body.scan(/#\w+/).uniq
  end

  def save_with_tags
    self.save
    tags = self.scan_tags
    tags.each do |tag|
      if Tag.exists?(body: tag)
        tag_id = Tag.find_by(body: tag).id
        self.tweet_tags.create(tag_id: tag_id)
      else
        self.tags.create(body: tag)
      end
    end
  end

end
