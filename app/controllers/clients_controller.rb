class ClientsController < ApplicationController
  before_action :authenticate_client!
  before_action :verify_is_client

  def create
    client = Client.create!(client_params)

    render json: client,
          #  serializer: Webhooks::Rh::Create::UserSerializer,
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
            # serializer: Internal::Admin::Show::ClientsSerializer,
            status: :ok
  end

  def destroy
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
