class Internal::Admin::Show::ClientsSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
