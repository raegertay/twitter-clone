class Tag < ApplicationRecord

  has_many :tweet_tags, dependent: :destroy
  has_many :tweets, through: :tweet_tags

  validates :body, presence: true, uniqueness: true

end
