class UserSerializer < ActiveModel::Serializer
  attributes  :name, :email, :api_token, :file, :id, :followers_count, :followees_count
  #
  # def file
  #  Refile.attachment_url(object, :file, :fit, 800, 800, format: "jpg")
  # end
end
