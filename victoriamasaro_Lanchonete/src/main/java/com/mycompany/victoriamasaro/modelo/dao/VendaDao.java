package com.mycompany.victoriamasaro.modelo.dao;

import com.mycompany.victoriamasaro.modelo.dao.entidade.Venda;
import com.mycompany.victoriamasaro.modelo.dao.entidade.Cliente;
import com.mycompany.victoriamasaro.modelo.dao.entidade.Funcionario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class VendaDao extends GenericoDAO<Venda> {

    public void salvar(Venda objVenda) {
        String sql = "INSERT INTO VENDA(dataHora, tipoPagamento, cliente_codCliente, funcionario_codFuncionario) VALUES (?, ?, ?, ?)";
        save(sql,
            objVenda.getDataHora(),
            objVenda.getTipoPagamento(),
            objVenda.getCodCliente().getCodCliente(),
            objVenda.getCodFuncionario().getCodFuncionario());
    }

    public void alterar(Venda objVenda) {
        String sql = "UPDATE VENDA SET dataHora=?, tipoPagamento=?, cliente_codCliente=?, funcionario_codFuncionario=? WHERE codVenda=?";
        save(sql,
            objVenda.getDataHora(),
            objVenda.getTipoPagamento(),
            objVenda.getCodCliente().getCodCliente(),
            objVenda.getCodFuncionario().getCodFuncionario(),
            objVenda.getCodVenda());
    }

    public void excluir(Venda objVenda) {
        String sql = "DELETE FROM VENDA WHERE codVenda=?";
        save(sql, objVenda.getCodVenda());
    }

    public List<Venda> buscarTodasVendas() {
        String sql = "SELECT * FROM VENDA";
        return buscarTodos(sql, new VendaRowMapper());
    }

    public Venda buscarVendaPorId(int codVenda) {
        String sql = "SELECT * FROM VENDA WHERE codVenda=?";
        return buscarPorId(sql, new VendaRowMapper(), codVenda);
    }

    private static class VendaRowMapper implements RowMapper<Venda> {
        private final ClienteDao clienteDao = new ClienteDao();
        private final FuncionarioDao funcionarioDao = new FuncionarioDao();

        @Override
        public Venda mapRow(ResultSet rs) throws SQLException {
            Venda venda = new Venda();
            venda.setCodVenda(rs.getInt("codVenda"));
            venda.setDataHora(rs.getString("dataHora"));
            venda.setTipoPagamento(rs.getString("tipoPagamento"));

            Cliente cliente = clienteDao.buscarClientePorID(rs.getInt("cliente_codCliente"));
            Funcionario funcionario = funcionarioDao.buscarFuncionarioPorId(rs.getInt("funcionario_codFuncionario"));

            venda.setCodCliente(cliente);
            venda.setCodFuncionario(funcionario);

            return venda;
        }
    }
}
