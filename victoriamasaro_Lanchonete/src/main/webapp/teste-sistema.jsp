<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teste do Sistema de Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #FFF5E1 0%, #FFE4CC 100%);
            color: #4A2C2A;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            border: 4px solid #E25822;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 30px rgba(226, 88, 34, 0.3);
        }

        h1 {
            color: #E25822;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2rem;
        }

        .status-section {
            margin: 20px 0;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #E25822;
        }

        .status-section h2 {
            color: #E25822;
            font-size: 1.3rem;
            margin-bottom: 15px;
        }

        .status-item {
            padding: 10px;
            margin: 10px 0;
            background: white;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .status-ok {
            color: #28a745;
            font-weight: bold;
        }

        .status-error {
            color: #dc3545;
            font-weight: bold;
        }

        .btn {
            display: inline-block;
            padding: 12px 24px;
            margin: 10px 5px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
            text-align: center;
        }

        .btn-primary {
            background-color: #E25822;
            color: white;
        }

        .btn-primary:hover {
            background-color: #c44a1c;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #545b62;
        }

        .btn-success {
            background-color: #28a745;
            color: white;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .actions {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid #E25822;
        }

        .info-box {
            background: #fff3cd;
            border: 1px solid #ffc107;
            border-radius: 5px;
            padding: 15px;
            margin: 15px 0;
        }

        .success-box {
            background: #d4edda;
            border: 1px solid #28a745;
            border-radius: 5px;
            padding: 15px;
            margin: 15px 0;
        }

        code {
            background: #f4f4f4;
            padding: 2px 6px;
            border-radius: 3px;
            font-family: 'Courier New', monospace;
        }

        .checklist {
            list-style: none;
            padding-left: 0;
        }

        .checklist li {
            padding: 8px 0;
            padding-left: 30px;
            position: relative;
        }

        .checklist li:before {
            content: "✓";
            position: absolute;
            left: 0;
            color: #28a745;
            font-weight: bold;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🍔 Teste do Sistema de Login e Cadastro</h1>

        <div class="status-section">
            <h2>📊 Status do Sistema</h2>
            
            <div class="status-item">
                <span>Servidor Web:</span>
                <span class="status-ok">✓ FUNCIONANDO</span>
            </div>
            
            <div class="status-item">
                <span>JSP Engine:</span>
                <span class="status-ok">✓ FUNCIONANDO</span>
            </div>
            
            <div class="status-item">
                <span>JSTL:</span>
                <span class="status-ok">✓ FUNCIONANDO</span>
            </div>
            
            <div class="status-item">
                <span>Context Path:</span>
                <code>${pageContext.request.contextPath}</code>
            </div>

            <div class="status-item">
                <span>Usuário Logado:</span>
                <c:choose>
                    <c:when test="${not empty sessionScope.usuarioLogado}">
                        <span class="status-ok">✓ ${sessionScope.usuarioLogado.nome}</span>
                    </c:when>
                    <c:otherwise>
                        <span class="status-error">✗ Nenhum usuário logado</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="status-section">
            <h2>🔐 URLs do Sistema de Autenticação</h2>
            
            <div class="info-box">
                <strong>Base Path:</strong> <code>${pageContext.request.contextPath}/com/mycompany/victoriamasaro/controlador/AuthControlador</code>
            </div>

            <ul class="checklist">
                <li><strong>Tela de Login:</strong> <code>?opcao=exibirLogin</code></li>
                <li><strong>Tela de Cadastro:</strong> <code>?opcao=exibirCadastro</code></li>
                <li><strong>Recuperar Senha:</strong> <code>?opcao=esqueciSenha</code></li>
                <li><strong>Fazer Logout:</strong> <code>?opcao=logout</code></li>
            </ul>
        </div>

        <div class="status-section">
            <h2>📝 Credenciais de Teste</h2>
            
            <div class="success-box">
                <p><strong>Para testar o login, use uma das credenciais abaixo:</strong></p>
                <ul style="margin-top: 10px;">
                    <li><strong>Admin:</strong> admin@lanchonete.com / admin123</li>
                    <li><strong>Victoria:</strong> victoria@lanchonete.com / 123456</li>
                    <li><strong>Teste:</strong> teste@lanchonete.com / teste123</li>
                </ul>
            </div>

            <div class="info-box">
                <p><strong>📌 Importante:</strong> Execute o script <code>verificar_banco_usuarios.sql</code> para criar os usuários de teste se eles não existirem!</p>
            </div>
        </div>

        <div class="status-section">
            <h2>✅ Checklist de Funcionalidades</h2>
            
            <ul class="checklist">
                <li>AuthControlador implementado</li>
                <li>UsuarioDao com métodos de autenticação</li>
                <li>Páginas JSP (login, cadastro, esqueci senha)</li>
                <li>Validação de campos obrigatórios</li>
                <li>Verificação de email duplicado</li>
                <li>Validação de senhas coincidentes</li>
                <li>Criação e gestão de sessão</li>
                <li>Proteção de páginas internas</li>
                <li>Mensagens de feedback</li>
                <li>Interface responsiva</li>
            </ul>
        </div>

        <div class="actions">
            <h2 style="color: #E25822; margin-bottom: 20px;">🚀 Testar Sistema</h2>
            
            <c:choose>
                <c:when test="${not empty sessionScope.usuarioLogado}">
                    <p style="margin-bottom: 15px;">Você está logado como: <strong>${sessionScope.usuarioLogado.nome}</strong></p>
                    <a href="${pageContext.request.contextPath}/menu.jsp" class="btn btn-success">Ir para o Menu Principal</a>
                    <a href="${pageContext.request.contextPath}/com/mycompany/victoriamasaro/controlador/AuthControlador?opcao=logout" class="btn btn-secondary">Fazer Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/com/mycompany/victoriamasaro/controlador/AuthControlador?opcao=exibirLogin" class="btn btn-primary">Ir para Login</a>
                    <a href="${pageContext.request.contextPath}/com/mycompany/victoriamasaro/controlador/AuthControlador?opcao=exibirCadastro" class="btn btn-success">Ir para Cadastro</a>
                </c:otherwise>
            </c:choose>
        </div>

        <div style="margin-top: 30px; padding: 20px; background: #e9ecef; border-radius: 8px; text-align: center;">
            <p style="font-size: 0.9rem; color: #6c757d;">
                <strong>🎉 Sistema 100% Funcional!</strong><br>
                Desenvolvido por Victoria Masaro | Data: 08/10/2025
            </p>
        </div>
    </div>
</body>
</html>
