package main.java.com.gestaoconfeitaria.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import main.java.com.gestaoconfeitaria.model.Fornecedor;
import main.java.com.gestaoconfeitaria.util.ConnectionFactory;

public class FornecedorDAO {
    private Connection connection;

    public FornecedorDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public void addFornecedor(Fornecedor fornecedor) {
        String sql = "INSERT INTO fornecedores (nome, endereco, telefone, email, dt_inclusao, dt_alteracao) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, fornecedor.getNome());
            stmt.setString(2, fornecedor.getEndereco());
            stmt.setString(3, fornecedor.getTelefone());
            stmt.setString(4, fornecedor.getEmail());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateFornecedor(Fornecedor fornecedor) {
        String sql = "UPDATE fornecedores SET nome = ?, endereco = ?, telefone = ?, email = ?, dt_alteracao = CURRENT_TIMESTAMP WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, fornecedor.getNome());
            stmt.setString(2, fornecedor.getEndereco());
            stmt.setString(3, fornecedor.getTelefone());
            stmt.setString(4, fornecedor.getEmail());
            stmt.setInt(5, fornecedor.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Fornecedor> getAllFornecedores() {
        List<Fornecedor> fornecedores = new ArrayList<>();
        String sql = "SELECT * FROM fornecedores";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.setId(rs.getInt("id"));
                fornecedor.setNome(rs.getString("nome"));
                fornecedor.setEndereco(rs.getString("endereco"));
                fornecedor.setTelefone(rs.getString("telefone"));
                fornecedor.setEmail(rs.getString("email"));
                fornecedor.setDtInclusao(rs.getTimestamp("dt_inclusao"));
                fornecedor.setDtAlteracao(rs.getTimestamp("dt_alteracao"));
                fornecedores.add(fornecedor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fornecedores;
    }
}