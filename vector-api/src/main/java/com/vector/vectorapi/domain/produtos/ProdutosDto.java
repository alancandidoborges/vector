package com.vector.vectorapi.domain.produtos;

import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public class ProdutosDto {
    @NotNull(message = "o campo [Cod] deve ser preenchido")
    private Long cod;
    @NotNull(message = "o campo [Descricao] deve ser preenchido")
    private String descricao;
    @NotNull(message = "o campo [Valor] deve ser preenchido")
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

    public ProdutosDto() {
        super();
    }

    public ProdutosDto(Long cod, String descricao, BigDecimal valor) {
        this.cod       = cod;
        this.descricao = descricao;
        this.valor     = valor;
    }
}
