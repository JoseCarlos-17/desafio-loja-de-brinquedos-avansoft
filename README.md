# Loja de Brinquedos - API

API construída em Ruby on Rails (API mode) com autenticação por token, gerenciamento de clientes e testes automatizados.
Os testes foram feitos com Rspec, e para rodá-los é só executar o comando "rspec caminho_arquivo_de_teste"

---

## Tecnologias

- Ruby on Rails 7
- SQLite (banco de dados)
- Devise Token Auth (autenticação)
- RSpec (testes)
- ActiveModel Serializers

---

## Autenticação

Dois tipos de usuários autenticáveis:

### Admin
- **Rota:** `POST /admin_auth/sign_in`

### Client
- **Rota:** `POST /client_auth/sign_in`

**Headers de autenticação esperados em requisições autenticadas:**

```http
access-token: <token>
client: <client_id>
uid: <email>
```

---

## Clientes (`Client`)

### Cadastro

- **Rota:** `POST /clients`  
- **Descrição:** Cadastra um novo cliente.

**Parâmetros:**
```json
{
  "client": {
    "name": "Ana",
    "email": "ana@example.com",
    "password": "12345678",
    "password_confirmation": "12345678"
  }
}
```

---

### Ver dados do próprio perfil

- **Rota:** `GET /clients/:id`  
- **Requer autenticação como:** `Client`

---

###  Atualizar dados do cliente

- **Rota:** `PUT /clients/:id`  
- **Requer autenticação como:** `Client`

**Parâmetros:**
```json
{
  "client": {
    "name": "Novo nome",
    "email": "novoemail@example.com"
  }
}
```

---

### Deletar a própria conta

- **Rota:** `DELETE /clients/remove_account`  
- **Requer autenticação como:** `Client`

> Deleta a conta do próprio cliente autenticado.

---

## Admin

### Listar todos os clientes

- **Rota:** `GET /internal/admin/clients`  
- **Requer autenticação como:** `Admin`

**Suporta filtros via query string:**

- `?by_name=ana`
- `?by_email=ana@example.com`

---

### Ver cliente específico

- **Rota:** `GET /internal/admin/clients/:id`  
- **Requer autenticação como:** `Admin`

---

### Atualizar cliente

- **Rota:** `PUT /internal/admin/clients/:id`  
- **Requer autenticação como:** `Admin`

---

### Deletar cliente

- **Rota:** `DELETE /internal/admin/clients/:id`  
- **Requer autenticação como:** `Admin`

---

**Cobertura:**

- Autenticação de clientes
- Fluxo de criação, edição, visualização e exclusão de clientes
- Verificações de autorização de acesso

---

##  Funcionalidades pendentes

Como eu priorizei a arquitetura do projeto adicionando o lado de "admin", as funcionalidades que não foram implementadas por limite de tempo foram:

- Criação de vendas (`Sales`)
- Endpoints de estatísticas por cliente
- Foto de perfil para Admin e Clientes com Active Storage

