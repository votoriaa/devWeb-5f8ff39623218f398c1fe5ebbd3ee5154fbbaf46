package com.mycompany.victoriamasaro.modelo.dao;

import com.mycompany.victoriamasaro.modelo.dao.entidade.Cliente;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ClienteDao extends GenericoDAO<Cliente> {

    public void salvar(Cliente objCliente) {
        String sql = "INSERT INTO CLIENTE (NOME, CPF, EMAIL, DATANASCIMENTO, TELEFONE, ENDERECO, BAIRRO, CIDADE, UF) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        save(sql, objCliente.getNome(), objCliente.getCpf(), objCliente.getEmail(), objCliente.getDataNascimento(), objCliente.getTelefone(), objCliente.getEndereco(), objCliente.getBairro(), objCliente.getCidade(), objCliente.getUf());
    }

    public void alterar(Cliente objCliente) {
        String sql = "UPDATE CLIENTE SET NOME=?, CPF=?, EMAIL=?, DATANASCIMENTO=?, TELEFONE=?, ENDERECO=?, BAIRRO=?, CIDADE=?, UF=? WHERE CODCLIENTE=?";
        save(sql, objCliente.getNome(), objCliente.getCpf(), objCliente.getEmail(), objCliente.getDataNascimento(), objCliente.getTelefone(), objCliente.getEndereco(), objCliente.getBairro(), objCliente.getCidade(), objCliente.getUf(), objCliente.getCodCliente());
    }

    public void excluir(Cliente objCliente) {
        String sql = "DELETE FROM CLIENTE WHERE CODCLIENTE=?";
        save(sql, objCliente.getCodCliente());
    }

    private static class ClienteRowMapper implements RowMapper<Cliente> {

        @Override
        public Cliente mapRow(ResultSet rs) throws SQLException {
            Cliente objCliente = new Cliente();
            objCliente.setCodCliente(rs.getInt("CODCLIENTE"));
            objCliente.setNome(rs.getString("NOME"));
            objCliente.setCpf(rs.getString("CPF"));
            objCliente.setEmail(rs.getString("EMAIL"));
            // Corrigido para buscar como java.sql.Date
            objCliente.setDataNascimento(rs.getDate("DATANASCIMENTO"));
            objCliente.setTelefone(rs.getString("TELEFONE"));
            objCliente.setEndereco(rs.getString("ENDERECO"));
            objCliente.setBairro(rs.getString("BAIRRO"));
            objCliente.setCidade(rs.getString("CIDADE"));
            objCliente.setUf(rs.getString("UF"));
            return objCliente;
        }
    }

    public List<Cliente> buscarTodosClientes() {
        String sql = "SELECT * FROM CLIENTE";
        return buscarTodos(sql, new ClienteRowMapper());
    }

    public Cliente buscarClientePorID(int idCliente) {
        String sql = "SELECT * FROM CLIENTE WHERE CODCLIENTE=?";
        return buscarPorId(sql, new ClienteRowMapper(), idCliente);
    }
}