package com.vector.vectorapi.domain.produtos;

import com.vector.vectorapi.utils.Convert;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ProdutosService {
    private final Convert convert;
    private final ProdutosRepository repository;
    public ProdutosService(Convert convert, ProdutosRepository repository){
        this.convert    = convert;
        this.repository = repository;
    }
    public String salvar(ProdutosDto dto){
        String strSql;
        strSql = "INSERT INTO tab_produtos(cod, descricao, valor) VALUES (";
        strSql = strSql + dto.getCod() + ", '" + dto.getDescricao() +  "', " + dto.getValor();
        var produto = new Produtos();

        Optional<Produtos> optional = repository.findById(dto.getCod());

        if (!optional.isPresent()){
            produto = convert.toProdutosEntity(dto);
            repository.save(produto);
            return strSql;
        } else {
            return "Produto ja cadastrado";
        }
    }
}
