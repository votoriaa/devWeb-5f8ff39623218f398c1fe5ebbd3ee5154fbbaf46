-- 🔍 Script de Verificação do Sistema de Entregas
-- Execute este script para verificar se tudo está correto

-- 1. Selecionar o banco de dados
USE lanchonete_2d_2024;

-- 2. Verificar se a tabela 'entregas' existe
SHOW TABLES LIKE 'entregas';
-- ✓ Deve retornar: entregas

-- 3. Ver a estrutura da tabela
DESCRIBE entregas;
-- ✓ Deve mostrar: codEntrega, endereco, numeroCasa, cliente_codCliente

-- 4. Ver as restrições da tabela
SHOW CREATE TABLE entregas;
-- ✓ Deve mostrar a Foreign Key para cliente

-- 5. Verificar se há clientes cadastrados (necessário para entregas)
SELECT codCliente, nome FROM cliente;
-- Se vazio, precisa cadastrar clientes primeiro!

-- 6. Verificar entregas existentes
SELECT * FROM entregas;

-- 7. Ver entregas com nome do cliente (JOIN)
SELECT 
    e.codEntrega,
    e.endereco,
    e.numeroCasa,
    c.nome as NomeCliente
FROM entregas e
INNER JOIN cliente c ON e.cliente_codCliente = c.codCliente;

-- 8. TESTE: Inserir uma entrega manualmente (só para testar)
-- Substitua '1' pelo ID de um cliente existente!
INSERT INTO entregas (endereco, numeroCasa, cliente_codCliente)
VALUES ('Rua Teste SQL', '999', 1);

-- 9. Verificar se a inserção funcionou
SELECT * FROM entregas WHERE numeroCasa = '999';
-- ✓ Deve retornar a entrega que acabamos de inserir

-- 10. Limpar o teste (opcional)
DELETE FROM entregas WHERE numeroCasa = '999';

-- 11. Contar entregas
SELECT COUNT(*) as TotalEntregas FROM entregas;

-- 12. Estatísticas
SELECT 
    COUNT(*) as 'Total de Entregas',
    COUNT(DISTINCT cliente_codCliente) as 'Clientes com Entregas'
FROM entregas;

-- ✅ RESULTADO ESPERADO:
-- • Tabela 'entregas' existe
-- • Possui as 4 colunas corretas
-- • Tem Foreign Key para cliente
-- • Consegue inserir/selecionar dados

-- ⚠️ SE DER ERRO:
-- Erro: Table 'entregas' doesn't exist
-- Solução: Execute o sql1508.sql para criar a estrutura

-- Erro: Cannot add or update a child row: a foreign key constraint fails
-- Solução: O cliente_codCliente informado não existe. Cadastre clientes primeiro.
