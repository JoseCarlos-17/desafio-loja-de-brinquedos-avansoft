require 'rails_helper'

RSpec.describe "Clients", type: :request do
  describe 'POST#create' do
    context 'when the client to register yourself' do
      let(:client_attributes) { attributes_for(:client,  name: 'John doe',
        email: 'johndoe@gmail.com', password: "123123123",
        password_confirmation: "123123123")
      }
      
      before do
        post '/clients', params: { client: client_attributes }
      end

      it 'must return 201 created status code' do
        expect(response).to have_http_status(:created)
      end

      it 'must return created client attributes' do
        expect(json_body).to include(:id, :name, :email)
      end
    end
  end

  describe 'GET#show' do
    context 'when a client see your profile' do
      let!(:client) { create(:client) }

      before do
        get "/clients/#{client.id}",
        headers: get_client_headers(client)
      end

      it 'must to return 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must to return client attributes' do
        expect(json_body).to include(:id, :name, :email)
      end
    end
  end

  describe 'PUT#update' do
    context 'when a song is updated by admin' do
      let!(:client) { create(:client) }
      let(:client_attributes) { attributes_for(:client,  name: 'John doe',
        email: 'johndoe@gmail.com', password: "123123123",
        password_confirmation: "123123123")
      }

      before do
        put "/clients/#{client.id}",
        params: { client: client_attributes },
        headers: get_client_headers(client)
      end

      it 'must return 204 status code' do
        expect(response).to have_http_status(:no_content)
      end

      it 'must update the client attributes' do
        expect(Client.last.name).to eq('John doe')
      end
    end
  end

  describe 'DELETE#remove_account' do
    context 'when a client delete your own account' do
      let!(:client) { create(:client) }

      before do
        delete "/clients/remove_account", headers: get_client_headers(client)
      end

      it 'must return 204 status code' do
        expect(response).to have_http_status(:no_content)
      end

      it 'must to delete the client above' do
        expect(Client.all.count).to eq(0)
      end
    end
  end
end
