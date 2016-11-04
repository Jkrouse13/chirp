class PostSerializer < ActiveModel::Serializer
  attributes  :id, :chirp, :file_id, :created_at
  has_one :user
end
