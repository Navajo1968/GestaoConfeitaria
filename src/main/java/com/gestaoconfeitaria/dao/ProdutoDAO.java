package main.java.com.gestaoconfeitaria.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import main.java.com.gestaoconfeitaria.model.Produto;
import main.java.com.gestaoconfeitaria.util.ConnectionFactory;

public class ProdutoDAO {
    private Connection connection;

    public ProdutoDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public void addProduto(Produto produto) {
        String sql = "INSERT INTO produtos (nome, descricao, preco, validade, tipo, dt_inclusao, dt_alteracao) VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, produto.getNome());
            stmt.setString(2, produto.getDescricao());
            stmt.setBigDecimal(3, produto.getPreco());
            stmt.setDate(4, produto.getValidade());
            stmt.setString(5, produto.getTipo());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProduto(Produto produto) {
        String sql = "UPDATE produtos SET nome = ?, descricao = ?, preco = ?, validade = ?, tipo = ?, dt_alteracao = CURRENT_TIMESTAMP WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, produto.getNome());
            stmt.setString(2, produto.getDescricao());
            stmt.setBigDecimal(3, produto.getPreco());
            stmt.setDate(4, produto.getValidade());
            stmt.setString(5, produto.getTipo());
            stmt.setInt(6, produto.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Produto> getAllProdutos() {
        List<Produto> produtos = new ArrayList<>();
        String sql = "SELECT * FROM produtos";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getBigDecimal("preco"));
                produto.setValidade(rs.getDate("validade"));
                produto.setTipo(rs.getString("tipo"));
                produto.setDtInclusao(rs.getTimestamp("dt_inclusao"));
                produto.setDtAlteracao(rs.getTimestamp("dt_alteracao"));
                produtos.add(produto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produtos;
    }
}