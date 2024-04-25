package com.vector.vectorapi.utils;

import com.vector.vectorapi.domain.produtos.Produtos;
import com.vector.vectorapi.domain.produtos.ProdutosDto;
import org.springframework.stereotype.Component;

@Component
public class Convert {
    public Produtos toProdutosEntity(ProdutosDto dto){
        var newProdutos = new Produtos();
        newProdutos.setCod(dto.getCod());
        newProdutos.setDescricao(dto.getDescricao());
        newProdutos.setValor(dto.getValor());
        return newProdutos;
    }
    public ProdutosDto toProdutosDto(Produtos produtos){
        var dto = new ProdutosDto();
        dto.setCod(produtos.getCod());
        dto.setDescricao(produtos.getDescricao());
        dto.setValor(produtos.getValor());
        return dto;
    }
}
