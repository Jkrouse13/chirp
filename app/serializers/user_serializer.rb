class UserSerializer < ActiveModel::Serializer
  attributes  :name, :email, :api_token, :file, :id, :followers_count, :followees_count, :route_to_file

  def route_to_file
    'https://www.herokuapp.heroku.com' + file
  end

  def file
     Refile.attachment_url(object, :file, :fit, 50, 50, format: "jpg")
  end
end
