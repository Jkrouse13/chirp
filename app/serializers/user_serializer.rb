class UserSerializer < ActiveModel::Serializer
  attributes  :name, :email, :api_token, :file
end
