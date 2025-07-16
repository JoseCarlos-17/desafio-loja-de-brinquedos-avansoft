class Internal::Admin::Index::ClientsSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
