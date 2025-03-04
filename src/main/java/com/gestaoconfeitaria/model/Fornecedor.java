package main.java.com.gestaoconfeitaria.model;

import java.sql.Timestamp;

public class Fornecedor {
    private int id;
    private String nome;
    private String endereco;
    private String telefone;
    private String email;
    private Timestamp dtInclusao;
    private Timestamp dtAlteracao;

    // Getters e Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getDtInclusao() {
        return dtInclusao;
    }

    public void setDtInclusao(Timestamp dtInclusao) {
        this.dtInclusao = dtInclusao;
    }

    public Timestamp getDtAlteracao() {
        return dtAlteracao;
    }

    public void setDtAlteracao(Timestamp dtAlteracao) {
        this.dtAlteracao = dtAlteracao;
    }
}