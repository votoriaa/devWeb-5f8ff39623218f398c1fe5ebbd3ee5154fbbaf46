-- Script SQL para verificar e configurar o banco de dados do sistema de login
-- Execute este script no seu banco de dados MySQL

-- 1. Selecionar o banco de dados
USE lanchonete_2d_2024;

-- 2. Verificar se a tabela USUARIO existe
SELECT 'Tabela USUARIO existe!' AS Status
FROM information_schema.tables 
WHERE table_schema = 'lanchonete_2d_2024' 
AND table_name = 'usuario';

-- 3. Verificar estrutura da tabela
DESCRIBE USUARIO;

-- 4. Verificar usuários existentes
SELECT * FROM USUARIO;

-- 5. Se não houver usuários, criar um usuário administrador padrão
-- Descomente as linhas abaixo se necessário:

-- DELETE FROM USUARIO; -- Use apenas se quiser limpar a tabela

INSERT IGNORE INTO USUARIO (NOME, EMAIL, SENHA) 
VALUES ('Administrador do Sistema', 'admin@lanchonete.com', 'admin123');

INSERT IGNORE INTO USUARIO (NOME, EMAIL, SENHA) 
VALUES ('Victoria Masaro', 'victoria@lanchonete.com', '123456');

INSERT IGNORE INTO USUARIO (NOME, EMAIL, SENHA) 
VALUES ('Teste Usuario', 'teste@lanchonete.com', 'teste123');

-- 6. Verificar os usuários criados
SELECT 
    IDUSUARIO as 'ID',
    NOME as 'Nome Completo',
    EMAIL as 'Email',
    SENHA as 'Senha',
    CREATED_AT as 'Data de Criação'
FROM USUARIO
ORDER BY IDUSUARIO;

-- 7. Testar autenticação de um usuário específico
-- Este é o comando que o sistema usa internamente:
SELECT * FROM USUARIO 
WHERE EMAIL='admin@lanchonete.com' 
AND SENHA='admin123';

-- 8. Verificar se um email já existe
SELECT COUNT(*) as 'Email Existe' 
FROM USUARIO 
WHERE EMAIL='admin@lanchonete.com';

-- 9. Estatísticas da tabela
SELECT 
    COUNT(*) as 'Total de Usuários',
    MAX(CREATED_AT) as 'Último Cadastro',
    MIN(CREATED_AT) as 'Primeiro Cadastro'
FROM USUARIO;

-- RESULTADO ESPERADO:
-- ✓ Tabela USUARIO deve existir
-- ✓ Deve ter as colunas: IDUSUARIO, NOME, EMAIL, SENHA, CREATED_AT
-- ✓ Deve ter pelo menos 1 usuário cadastrado
-- ✓ EMAIL deve ser UNIQUE
-- ✓ IDUSUARIO deve ser AUTO_INCREMENT

-- CREDENCIAIS DE TESTE:
-- Email: admin@lanchonete.com | Senha: admin123
-- Email: victoria@lanchonete.com | Senha: 123456
-- Email: teste@lanchonete.com | Senha: teste123
