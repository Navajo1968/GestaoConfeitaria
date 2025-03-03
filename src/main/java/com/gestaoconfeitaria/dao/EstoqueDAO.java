package com.gestaoconfeitaria.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gestaoconfeitaria.model.Estoque;
import com.gestaoconfeitaria.util.ConnectionFactory;

public class EstoqueDAO {
    private Connection connection;

    public EstoqueDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public void addEstoque(Estoque estoque) {
        String sql = "INSERT INTO estoque (produto_id, quantidade, data_validade, dt_inclusao, dt_alteracao) VALUES (?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, estoque.getProdutoId());
            stmt.setInt(2, estoque.getQuantidade());
            stmt.setDate(3, estoque.getDataValidade());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateEstoque(Estoque estoque) {
        String sql = "UPDATE estoque SET produto_id = ?, quantidade = ?, data_validade = ?, dt_alteracao = CURRENT_TIMESTAMP WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, estoque.getProdutoId());
            stmt.setInt(2, estoque.getQuantidade());
            stmt.setDate(3, estoque.getDataValidade());
            stmt.setInt(4, estoque.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Estoque> getAllEstoques() {
        List<Estoque> estoques = new ArrayList<>();
        String sql = "SELECT * FROM estoque";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Estoque estoque = new Estoque();
                estoque.setId(rs.getInt("id"));
                estoque.setProdutoId(rs.getInt("produto_id"));
                estoque.setQuantidade(rs.getInt("quantidade"));
                estoque.setDataValidade(rs.getDate("data_validade"));
                estoque.setDtInclusao(rs.getTimestamp("dt_inclusao"));
                estoque.setDtAlteracao(rs.getTimestamp("dt_alteracao"));
                estoques.add(estoque);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return estoques;
    }
}