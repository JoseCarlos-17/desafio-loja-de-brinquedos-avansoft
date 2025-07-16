module Authorization
  def verify_is_client
    unless current_client.present?
      render json: {
        message: 'Você não tem permissão para acessar a este recurso.'
      },
      status: :forbidden
    end
  end

  def verify_is_admin
    unless current_admin.present?
      render json: {
        message: 'Você não tem permissão para acessar a este recurso.'
      },
      status: :forbidden
    end
  end
end
