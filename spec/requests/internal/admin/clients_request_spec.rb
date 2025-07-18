require 'rails_helper'

RSpec.describe "Internal::Admin::Clients", type: :request do
  let!(:admin) { create(:admin) }

  describe 'GET#index' do
    context 'when clients are listed' do
      let!(:clients) {
        create_list(:client, 2)
      }

      before do
        get '/internal/admin/clients', headers: get_admin_headers(admin)
      end

      it 'must to return 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must to return the first client attributes' do
        expect(json_body[0]).to include(:id, :name, :email)
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
        put "/internal/admin/clients/#{client.id}",
        params: { client: client_attributes },
        headers: get_admin_headers(admin)
      end

      it 'must return 204 status code' do
        expect(response).to have_http_status(:no_content)
      end

      it 'must update the client attributes' do
        expect(Client.last.name).to eq('John doe')
      end
    end
  end

  describe 'GET#show' do
    context 'when a client is selected by manager' do
      let(:client) { create(:client) }

      before do
        get "/internal/admin/clients/#{client.id}",
        headers: get_admin_headers(admin)
      end

      it 'must to return 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must to return client attributes' do
        expect(json_body).to include(:id, :name, :email)
      end
    end
  end

  describe 'DELETE#destroy' do
    context 'when a client is deleted' do
      let!(:client) { create(:client) }

      before do
        delete "/internal/admin/clients/#{client.id}",
        headers: get_admin_headers(admin)
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
