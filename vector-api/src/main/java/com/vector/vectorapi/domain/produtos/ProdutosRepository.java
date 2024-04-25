package com.vector.vectorapi.domain.produtos;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProdutosRepository extends JpaRepository<Produtos, Long> {
    boolean existsById(Long id);
}
