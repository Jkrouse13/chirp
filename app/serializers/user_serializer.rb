class UserSerializer < ActiveModel::Serializer
  attributes  :name, :email, :api_token, :file, :id, :followers_count, :followees_count

  has_many :posts
end
