def json_body
  JSON.parse(response.body, symbolize_names: true)
end

def get_client_headers(client)
  post '/client_auth/sign_in',
  params: { email: client.email, password: client.password },
  as: :json

  {
    'access-token': response.headers['access-token'],
    'client': response.headers['client'],
    'uid': response.headers['uid'],
    'expiry': response.headers['expiry'],
    'token-type': response.headers['token-type']
  }
end

def get_admin_headers(admin)
  post '/admin_auth/sign_in',
  params: { email: admin.email, password: admin.password },
  as: :json

  {
    'access-token': response.headers['access-token'],
    'client': response.headers['client'],
    'uid': response.headers['uid'],
    'expiry': response.headers['expiry'],
    'token-type': response.headers['token-type']
  }
end