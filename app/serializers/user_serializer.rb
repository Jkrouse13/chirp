class UserSerializer < ActiveModel::Serializer
  attributes  :name, :email, :api_token, :file, :id, :followers_count, :followees_count



  def file
    if @file == nil
      "https://robohash.org/" + "#{object.name}"
    else
     Refile.attachment_url(object, :file, :fit, 50, 50, format: "jpg")
    end
  end
end
