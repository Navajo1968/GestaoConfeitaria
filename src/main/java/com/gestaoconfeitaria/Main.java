package main.java.com.gestaoconfeitaria;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    private static final String URL = "jdbc:postgresql://localhost:5432/gestaoconfeitaria";
    private static final String USER = "postgres";
    private static final String PASSWORD = "@NaVaJo68#PostGre#";

    public static void main(String[] args) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            System.out.println("Conexão com o banco de dados estabelecida com sucesso!");
        } catch (SQLException e) {
            System.out.println("Falha ao conectar com o banco de dados!");
            e.printStackTrace();
        }
    }
}