class PostSerializer < ActiveModel::Serializer
  attributes  :id, :chirp, :file, :created_at
  has_one :user

  def file
     Refile.attachment_url(object, :file, :fit, 800, 800, format: "jpg")
  end
end
