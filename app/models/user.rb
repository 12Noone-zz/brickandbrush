class User < ActiveRecord::Base
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  has_many(:favorite_posts, {through: :favorites, source: :post})

  has_attached_file :avatar, styles: {
		med: "200x200#",
	}

  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
