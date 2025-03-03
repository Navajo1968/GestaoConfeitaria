package com.gestaoconfeitaria.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gestaoconfeitaria.model.Papel;
import com.gestaoconfeitaria.model.Usuario;
import com.gestaoconfeitaria.util.ConnectionFactory;

public class UsuarioDAO {
    private Connection connection;

    public UsuarioDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    public void addUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Usuario> getAllUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setPapeis(getPapeisByUsuarioId(usuario.getId()));
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    private List<Papel> getPapeisByUsuarioId(int usuarioId) {
        List<Papel> papeis = new ArrayList<>();
        String sql = "SELECT p.id, p.nome FROM papeis p " +
                     "INNER JOIN usuario_papel up ON p.id = up.papel_id " +
                     "WHERE up.usuario_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, usuarioId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Papel papel = new Papel();
                    papel.setId(rs.getInt("id"));
                    papel.setNome(rs.getString("nome"));
                    papeis.add(papel);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return papeis;
    }
}