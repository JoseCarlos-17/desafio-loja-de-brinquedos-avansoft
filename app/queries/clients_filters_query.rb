class ClientsFiltersQuery
  attr_accessor :clients, :params

  def initialize(clients = Client.all, params)
    @clients = clients
    @params = params
  end

  def call
    clients = @clients

    clients = filter_by_name(clients) if params[:by_name]
    clients = filter_by_email(clients) if params[:by_email]

    clients
  end

  private

  def filter_by_name(list)
    list.where(name: params[:by_name])
  end

  def filter_by_email(list)
    list.where(email: params[:by_email])
  end
end
