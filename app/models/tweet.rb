class Tweet < ApplicationRecord

  belongs_to :user
  has_many :tweet_tags, dependent: :destroy
  has_many :tags, through: :tweet_tags

  validates :body, presence: true, length: { maximum: 140 }

  # Return all tags in tweet in array format
  def scan_tags
    self.body.scan(/#\w+/).uniq
  end

end
