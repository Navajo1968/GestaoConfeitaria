package main.java.com.gestaoconfeitaria.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import main.java.com.gestaoconfeitaria.model.Papel;
import main.java.com.gestaoconfeitaria.model.Permissao;
import main.java.com.gestaoconfeitaria.util.ConnectionFactory;

public class PapelDAO {
    private Connection connection;

    public PapelDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public void addPapel(Papel papel) {
        String sql = "INSERT INTO papeis (nome, dt_inclusao, dt_alteracao) VALUES (?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, papel.getNome());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePapel(Papel papel) {
        String sql = "UPDATE papeis SET nome = ?, dt_alteracao = CURRENT_TIMESTAMP WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, papel.getNome());
            stmt.setInt(2, papel.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Papel> getAllPapeis() {
        List<Papel> papeis = new ArrayList<>();
        String sql = "SELECT * FROM papeis";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Papel papel = new Papel();
                papel.setId(rs.getInt("id"));
                papel.setNome(rs.getString("nome"));
                papel.setDtInclusao(rs.getTimestamp("dt_inclusao"));
                papel.setDtAlteracao(rs.getTimestamp("dt_alteracao"));
                papel.setPermissoes(getPermissoesByPapelId(papel.getId()));
                papeis.add(papel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return papeis;
    }

    private List<Permissao> getPermissoesByPapelId(int papelId) {
        List<Permissao> permissoes = new ArrayList<>();
        String sql = "SELECT pm.id, pm.nome FROM permissoes pm " +
                     "INNER JOIN papel_permissao pp ON pm.id = pp.permissao_id " +
                     "WHERE pp.papel_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, papelId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Permissao permissao = new Permissao();
                    permissao.setId(rs.getInt("id"));
                    permissao.setNome(rs.getString("nome"));
                    permissoes.add(permissao);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return permissoes;
    }
}