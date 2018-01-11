class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates :username, presence: true, uniqueness: true

  has_many :tweets, dependent: :destroy

  has_many :followings, foreign_key: :follower_id, dependent: :destroy
  has_many :followees, through: :followings

  has_many :inverse_followings, class_name: 'Following', foreign_key: :followee_id, dependent: :destroy
  has_many :followers, through: :inverse_followings

  include PgSearch
  pg_search_scope :search,
  against: :username,
  using: { trigram: { threshold: 0.1 } }

  def follow(followee)
    self.followings.create(followee: followee)
  end

  def unfollow(followee)
    self.followees.destroy(followee)
  end

  # Return users not currently following
  def not_following
    ids_to_exclude = self.followees.ids + [self.id]
    User.where.not(id: ids_to_exclude)
  end

  # Return the tweets belonging to self and self.followings, ordered by desc 'created_at'
  def mixed_tweets
    ids_to_include = self.followees.ids + [self.id]
    Tweet.where(user_id: ids_to_include).order(created_at: :desc)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      byebug
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
