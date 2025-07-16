class Client::Show::ClientsSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
