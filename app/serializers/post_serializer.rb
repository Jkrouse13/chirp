class PostSerializer < ActiveModel::Serializer
  attributes  :chirp, :file_id
  has_one :user
end
