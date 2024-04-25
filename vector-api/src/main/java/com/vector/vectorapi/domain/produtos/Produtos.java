package com.vector.vectorapi.domain.produtos;

import java.io.Serializable;
import java.math.BigDecimal;

import jakarta.persistence.*;

@Entity
@Table(name = "tab_produtos")
public class Produtos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    private Long cod;
    @Column(name = "descricao", length = 50, nullable = false)
    private String descricao;
    @Column(name = "valor", precision = 12, scale = 2, nullable = false)
    private BigDecimal valor;

    public Long getCod() {
        return cod;
    }

    public void setCod(Long cod) {
        this.cod = cod;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }
    public Produtos() {
        super();
    }
    public Produtos(Long cod, String descricao, BigDecimal valor) {
        super();
        this.cod       = cod;
        this.descricao = descricao;
        this.valor     = valor;
    }
}
