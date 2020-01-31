class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :id_document, :phone
end
