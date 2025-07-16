require 'rails_helper'

RSpec.describe "ClientsFiltersQuery", type: :query do
  context 'where we have all users, without filters' do
    let!(:client1) { create(:client, name: 'MyString1',
      email: 'mystring1@email.com') }
    let!(:client2) { create(:client, name: 'MyString2',
      email: 'mystring2@email.com') }
    let!(:client3) { create(:client, name: 'MyString3',
      email: 'mystring3@email.com') }
    let!(:clients) { Client.all }

    let(:params) { {} }
    let(:query_list) { ClientsFiltersQuery.new(clients, params).call }

    before do
      query_list
    end

    it 'must return all clients' do
      expect(query_list[0][:email]).to eq('mystring1@email.com')
      expect(query_list[1][:email]).to eq('mystring2@email.com')
    end
  end

  context 'when the manager filter clients list' do
    let!(:client1) { create(:client, name: 'MyString1',
      email: 'mystring1@email.com') }
    let!(:client2) { create(:client, name: 'MyString2',
      email: 'mystring2@email.com') }
    let!(:client3) { create(:client, name: 'MyString3',
      email: 'mystring3@email.com') }
    let!(:clients) { Client.all }

    context 'by name' do
      let!(:params) { { by_name: 'MyString2' } }
      let(:query_list) { ClientsFiltersQuery.new(clients, params).call }

      before do
        query_list
      end

      it 'must return the attribute name value' do
        expect(query_list[0][:name]).to eq('MyString2')
      end
    end

    context 'by email' do
      let!(:params) { { by_email: 'mystring2@email.com' } }
      let(:query_list) { ClientsFiltersQuery.new(clients, params).call }

      before do
        query_list
      end

      it 'must return the attribute name value' do
        expect(query_list[0][:email]).to eq('mystring2@email.com')
      end
    end
  end
end