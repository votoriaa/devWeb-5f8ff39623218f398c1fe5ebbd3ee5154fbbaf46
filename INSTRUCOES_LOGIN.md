# 🍔 Sistema de Login e Cadastro - Instruções

## ✅ Status do Sistema

O sistema de cadastro e login está **FUNCIONANDO CORRETAMENTE**! Todos os componentes necessários estão implementados.

## 📋 Componentes Implementados

### 1. **Controlador de Autenticação** ✓
- `AuthControlador.java` - Gerencia login, cadastro e recuperação de senha
- URL: `/com/mycompany/victoriamasaro/controlador/AuthControlador`

### 2. **Páginas JSP** ✓
- `login.jsp` - Tela de login
- `cadastro.jsp` - Tela de cadastro
- `esqueciSenha.jsp` - Tela de recuperação de senha
- `index.html` - Redireciona para o login

### 3. **Modelo de Dados** ✓
- `Usuario.java` - Entidade de usuário
- `UsuarioDao.java` - Acesso ao banco de dados
- Tabela `USUARIO` no banco de dados

### 4. **Banco de Dados** ✓
- Tabela `USUARIO` já criada no banco `lanchonete_2d_2024`
- Campos: `IDUSUARIO`, `NOME`, `EMAIL`, `SENHA`, `CREATED_AT`

## 🚀 Como Usar o Sistema

### Passo 1: Verificar Banco de Dados

Certifique-se de que o banco de dados está rodando:
- **Host:** localhost
- **Porta:** 3307
- **Banco:** lanchonete_2d_2024
- **Usuário:** root
- **Senha:** 1234

Se necessário, execute o script SQL completo:
```sql
-- O arquivo sql1508.sql já contém a tabela USUARIO criada!
```

### Passo 2: Verificar se há usuários no banco

Execute no MySQL:
```sql
USE lanchonete_2d_2024;
SELECT * FROM USUARIO;
```

Se não houver usuários, crie um usuário de teste:
```sql
INSERT INTO USUARIO (NOME, EMAIL, SENHA) 
VALUES ('Administrador', 'admin@lanchonete.com', 'admin123');
```

### Passo 3: Iniciar o Servidor

1. Compile o projeto (Maven):
   ```
   mvn clean install
   ```

2. Deploy no GlassFish ou servidor de aplicação

3. Acesse: `http://localhost:8080/victoriamasaro-1.0-SNAPSHOT/`

### Passo 4: Testar o Sistema

#### A. Cadastro de Novo Usuário
1. Acesse a tela de login
2. Clique em "Não tem conta? Cadastre-se"
3. Preencha os dados:
   - Nome completo
   - Email
   - Senha (mínimo 4 caracteres)
   - Confirmar senha
4. Clique em "Cadastrar"

#### B. Login
1. Na tela de login, digite:
   - Email do usuário cadastrado
   - Senha correspondente
2. Clique em "Entrar"
3. Você será redirecionado para `menu.jsp`

#### C. Recuperar Senha
1. Clique em "Esqueci minha senha"
2. Digite seu email
3. O sistema mostrará sua senha
   *(Em produção, seria enviado por email)*

## 🔧 Funcionalidades Implementadas

### Autenticação
- ✅ Login com email e senha
- ✅ Validação de credenciais no banco
- ✅ Criação de sessão para usuário logado
- ✅ Timeout de sessão (30 minutos)
- ✅ Logout

### Cadastro
- ✅ Validação de campos obrigatórios
- ✅ Verificação de senhas coincidentes (frontend)
- ✅ Verificação de email duplicado
- ✅ Salvamento no banco de dados
- ✅ Mensagens de sucesso/erro

### Segurança
- ✅ Proteção contra SQL Injection (PreparedStatement)
- ✅ Validação de email único
- ✅ Validação de campos obrigatórios
- ✅ Gestão de sessão HTTP

## 📝 URLs do Sistema

| Funcionalidade | URL | Método |
|---------------|-----|--------|
| Exibir Login | `AuthControlador?opcao=exibirLogin` | GET |
| Realizar Login | `AuthControlador` (opcao=login) | POST |
| Exibir Cadastro | `AuthControlador?opcao=exibirCadastro` | GET |
| Realizar Cadastro | `AuthControlador` (opcao=cadastrar) | POST |
| Esqueci Senha | `AuthControlador?opcao=esqueciSenha` | GET/POST |
| Logout | `AuthControlador?opcao=logout` | GET |

## 🎨 Interface

O sistema possui uma interface moderna com:
- Design responsivo (funciona em mobile)
- Cores temáticas da lanchonete
- Mensagens de feedback (sucesso/erro)
- Validação em tempo real
- Experiência de usuário intuitiva

## 🐛 Troubleshooting

### Problema: "Email ou senha incorretos"
**Solução:** 
- Verifique se o usuário existe no banco
- Confirme que o email e senha estão corretos
- Certifique-se de que a conexão com o banco está funcionando

### Problema: "Este email já está cadastrado"
**Solução:**
- Use outro email
- Ou faça login com o email existente

### Problema: Erro de conexão com banco
**Solução:**
- Verifique se o MySQL está rodando na porta 3307
- Confirme usuário e senha no `ConnectionFactory.java`
- Verifique se o banco `lanchonete_2d_2024` existe

### Problema: Página não carrega
**Solução:**
- Verifique se o servidor está rodando
- Confirme que o WAR foi implantado corretamente
- Verifique logs do servidor

## 📊 Estrutura de Dados

```java
Usuario {
    idUsuario: int (auto_increment)
    nome: String (100 chars)
    email: String (100 chars, único)
    senha: String (100 chars)
    created_at: Timestamp (auto)
}
```

## 🔐 Melhorias Futuras (Recomendações)

1. **Criptografia de Senha**
   - Implementar BCrypt ou similar
   - Nunca armazenar senhas em texto puro

2. **Recuperação de Senha Real**
   - Integração com serviço de email
   - Token de redefinição temporário

3. **Validações Adicionais**
   - Força da senha
   - Formato de email
   - CAPTCHA para cadastro

4. **Auditoria**
   - Log de tentativas de login
   - Registro de ações do usuário

## ✨ Sistema Pronto para Uso!

O sistema está **100% funcional** e pronto para uso. Basta seguir os passos acima para começar a usar!

**Data de Verificação:** 08/10/2025
**Status:** ✅ FUNCIONANDO
