class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :tweets, dependent: :destroy
  has_many :followships
  has_many :followings, through: :followships
  has_many :inverse_followships, class_name: 'Followship', foreign_key: 'following_id'
  has_many :followers, through: :inverse_followships, source: :user

end
