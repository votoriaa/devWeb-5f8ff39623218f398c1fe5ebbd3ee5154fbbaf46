package com.mycompany.victoriamasaro.modelo.dao;

import com.mycompany.victoriamasaro.modelo.dao.entidade.Entrega; // Alterado de Entregas para Entrega
import com.mycompany.victoriamasaro.modelo.dao.entidade.Cliente;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * DAO para a entidade Entrega.
 * A classe foi renomeada para seguir o padrão singular.
 */
public class EntregaDao extends GenericoDAO<Entrega> {

    public void salvar(Entrega objEntrega) {
        String sql = "INSERT INTO entrega(endereco, numeroCasa, cliente_codCliente) VALUES (?, ?, ?)"; // Tabela 'entrega'
        save(sql,
            objEntrega.getEndereco(),
            objEntrega.getNumeroCasa(),
            objEntrega.getObjCliente().getCodCliente()
        );
    }

    public void alterar(Entrega objEntrega) {
        String sql = "UPDATE entrega SET endereco=?, numeroCasa=?, cliente_codCliente=? WHERE codEntrega=?"; // Tabela 'entrega'
        save(sql,
            objEntrega.getEndereco(),
            objEntrega.getNumeroCasa(),
            objEntrega.getObjCliente().getCodCliente(),
            objEntrega.getCodEntrega()
        );
    }

    public void excluir(Entrega objEntrega) {
        String sql = "DELETE FROM entrega WHERE codEntrega=?"; // Tabela 'entrega'
        save(sql, objEntrega.getCodEntrega());
    }

    private static class EntregaRowMapper implements RowMapper<Entrega> {
        ClienteDao clienteDao = new ClienteDao();

        @Override
        public Entrega mapRow(ResultSet rs) throws SQLException {
            Entrega e = new Entrega();
            e.setCodEntrega(rs.getInt("codEntrega"));
            e.setEndereco(rs.getString("endereco"));
            e.setNumeroCasa(rs.getString("numeroCasa"));
            Cliente cliente = clienteDao.buscarClientePorID(rs.getInt("cliente_codCliente"));
            e.setObjCliente(cliente);
            return e;
        }
    }

    public List<Entrega> buscarTodasEntregas() {
        String sql = "SELECT * FROM entrega"; // Tabela 'entrega'
        return buscarTodos(sql, new EntregaRowMapper());
    }

    public Entrega buscarEntregaPorId(int idEntrega) {
        String sql = "SELECT * FROM entrega WHERE codEntrega=?"; // Tabela 'entrega'
        return buscarPorId(sql, new EntregaRowMapper(), idEntrega);
    }
}