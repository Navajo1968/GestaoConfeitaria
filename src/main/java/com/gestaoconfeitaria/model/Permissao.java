package main.java.com.gestaoconfeitaria.model;

import java.sql.Timestamp;

public class Permissao {
    private int id;
    private String nome;
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