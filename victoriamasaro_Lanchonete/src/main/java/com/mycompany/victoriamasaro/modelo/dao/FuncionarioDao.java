package com.mycompany.victoriamasaro.modelo.dao;

import com.mycompany.victoriamasaro.modelo.dao.entidade.Funcionario;
//import com.mycompany.victoriamasaro.modelo.dao.entidade.Cargo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class FuncionarioDao extends GenericoDAO<Funcionario> {

    public void salvar(Funcionario objFuncionario) {
        String sql = "INSERT INTO FUNCIONARIO(nome, carTrab, cpf, email, salarioAtual, dataAdmissao, cargo_codCargo) VALUES (?, ?, ?, ?, ?, ?, ?)";
        save(sql,
            objFuncionario.getNome(),
            objFuncionario.getCarTrab(),
            objFuncionario.getCpf(),
            objFuncionario.getEmail(),
            objFuncionario.getSalarioAtual(),
            objFuncionario.getDataAdmissao(),
            objFuncionario.getObjCargo().getCodCargo()
        );
    }

    public void alterar(Funcionario objFuncionario) {
        String sql = "UPDATE FUNCIONARIO SET nome=?, carTrab=?, cpf=?, email=?, salarioAtual=?, dataAdmissao=?, cargo_codCargo=? WHERE codFuncionario=?";
        save(sql,
            objFuncionario.getNome(),
            objFuncionario.getCarTrab(),
            objFuncionario.getCpf(),
            objFuncionario.getEmail(),
            objFuncionario.getSalarioAtual(),
            objFuncionario.getDataAdmissao(),
            objFuncionario.getObjCargo().getCodCargo(),
            objFuncionario.getCodFuncionario()
        );
    }

    public void excluir(Funcionario objFuncionario) {
        String sql = "DELETE FROM FUNCIONARIO WHERE codFuncionario=?";
        save(sql, objFuncionario.getCodFuncionario());
    }

    private static class FuncionarioRowMapper implements RowMapper<Funcionario> {
        CargoDao cargoDao = new CargoDao();

        @Override
        public Funcionario mapRow(ResultSet rs) throws SQLException {
            Funcionario f = new Funcionario();
            f.setCodFuncionario(rs.getInt("codFuncionario"));
            f.setNome(rs.getString("nome"));
            f.setCarTrab(rs.getString("carTrab"));
            f.setCpf(rs.getString("cpf"));
            f.setEmail(rs.getString("email"));
            f.setSalarioAtual(rs.getDouble("salarioAtual"));
            f.setDataAdmissao(rs.getDate("dataAdmissao"));
            f.setObjCargo(cargoDao.buscarCargoPorID(rs.getInt("cargo_codCargo")));
            return f;
        }
    }

    public List<Funcionario> buscarTodosFuncionarios() {
        String sql = "SELECT * FROM FUNCIONARIO";
        return buscarTodos(sql, new FuncionarioRowMapper());
    }

    public Funcionario buscarFuncionarioPorId(int idFuncionario) {
        String sql = "SELECT * FROM FUNCIONARIO WHERE codFuncionario=?";
        return buscarPorId(sql, new FuncionarioRowMapper(), idFuncionario);
    }
}
