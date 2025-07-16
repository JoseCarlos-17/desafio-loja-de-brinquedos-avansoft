class Internal::Admin::ClientsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :destroy, :update]
  before_action :verify_is_admin

  def index
    clients = ClientsFiltersQuery.new(params).call

    render json: clients,
            each_serializer: Internal::Admin::Index::ClientsSerializer,
            status: :ok
  end

  def update
    client = Client.find(params[:id])

    client.update(client_params)

    head :no_content
  end

  def show
    client = Client.find(params[:id])

    render json: client,
            serializer: Internal::Admin::Show::ClientsSerializer,
            status: :ok
  end

  def destroy
    client = Client.find(params[:id])

    client.destroy!

    head :no_content
  end

  private

  def client_params
    params.require(:client).permit(:name, :email,
                                   :password, :password_confirmation)
  end
end
