package com.gestaoconfeitaria.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gestaoconfeitaria.model.Permissao;
import com.gestaoconfeitaria.util.ConnectionFactory;

public class PermissaoDAO {
    private Connection connection;

    public PermissaoDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public void addPermissao(Permissao permissao) {
        String sql = "INSERT INTO permissoes (nome) VALUES (?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, permissao.getNome());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Permissao> getAllPermissoes() {
        List<Permissao> permissoes = new ArrayList<>();
        String sql = "SELECT * FROM permissoes";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Permissao permissao = new Permissao();
                permissao.setId(rs.getInt("id"));
                permissao.setNome(rs.getString("nome"));
                permissoes.add(permissao);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return permissoes;
    }
}