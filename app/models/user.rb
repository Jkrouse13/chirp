class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_token
  validates_presence_of :name, :email, :password
  validates :email,
            format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
            uniqueness: true


  attachment :file, type: :image
  acts_as_follower
  acts_as_followable
  has_many :posts
  def file
   Refile.attachment_url(object, :file, :fit, 800, 800, format: "jpg")
  end
end
