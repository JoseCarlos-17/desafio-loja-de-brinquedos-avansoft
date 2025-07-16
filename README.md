# 🧸 Loja de Brinquedos - API

API construída em Ruby on Rails (API mode) com autenticação por token, gerenciamento de clientes e testes automatizados.

---

## 🚀 Tecnologias

- Ruby on Rails 7
- SQLite (banco de dados)
- Devise Token Auth (autenticação)
- RSpec (testes)
- ActiveModel Serializers

---

## 🔐 Autenticação

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

## 👤 Clientes (`Client`)

### 📥 Cadastro

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

### 👁️ Ver dados do próprio perfil

- **Rota:** `GET /clients/:id`  
- **Requer autenticação como:** `Client`

---

### ✏️ Atualizar dados do cliente

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

### ❌ Deletar a própria conta

- **Rota:** `DELETE /clients/remove_account`  
- **Requer autenticação como:** `Client`

> Deleta a conta do próprio cliente autenticado.

---

## 🛠️ Admin

### 📄 Listar todos os clientes

- **Rota:** `GET /internal/admin/clients`  
- **Requer autenticação como:** `Admin`

**Suporta filtros via query string:**

- `?by_name=ana`
- `?by_email=ana@example.com`

---

### 🔍 Ver cliente específico

- **Rota:** `GET /internal/admin/clients/:id`  
- **Requer autenticação como:** `Admin`

---

### 📝 Atualizar cliente

- **Rota:** `PUT /internal/admin/clients/:id`  
- **Requer autenticação como:** `Admin`

---

### 🗑️ Deletar cliente

- **Rota:** `DELETE /internal/admin/clients/:id`  
- **Requer autenticação como:** `Admin`

---

## ✅ Testes Automatizados

Testes implementados com `RSpec`.

**Para rodar:**
```bash
bundle exec rspec
```

**Cobertura:**

- Autenticação de clientes
- Fluxo de criação, edição, visualização e exclusão de clientes
- Verificações de autorização de acesso

---

## ⚠️ Funcionalidades pendentes

Por limite de tempo (entrega em 1 dia), as funcionalidades abaixo não foram implementadas:

- Criação de vendas (`Sales`)
- Endpoints de estatísticas por cliente

---

## 📌 Observações finais

A aplicação foi estruturada para refletir boas práticas de organização:

- Separação entre controle de admins e clientes
- Uso de namespaces (`Internal::Admin`)
- Controle de autorização por tipo de usuário
- Autenticação com Devise Token Auth
- Testes automatizados com cobertura do fluxo principal
