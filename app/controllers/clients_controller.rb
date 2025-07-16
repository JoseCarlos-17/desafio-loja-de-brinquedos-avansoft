class ClientsController < ApplicationController
  before_action :authenticate_client!, only: [:update, :show, :remove_account]
  before_action :verify_is_client, only: [:update, :show, :remove_account]
  skip_after_action :update_auth_header, only: [:remove_account]

  def create
    client = Client.create!(client_params)

    render json: client,
           serializer: Client::Create::ClientsSerializer,
           status: :created
  end

  def update
    client = current_client

    client.update(client_params)

    head :no_content
  end

  def show
    client = current_client

    render json: client,
            serializer: Client::Show::ClientsSerializer,
            status: :ok
  end

  def remove_account
    client = current_client

    client.destroy!

    head :no_content
  end

  private

  def client_params
    params.require(:client).permit(:name, :email,
                                   :password, :password_confirmation)
  end
end
