class Client::Create::ClientsSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
