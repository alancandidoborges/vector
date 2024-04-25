package com.vector.vectorapi.domain.produtos;

import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/vector/produtos")
@CrossOrigin(origins = "*")
public class ProdutosController {
    private final ProdutosService service;
    public ProdutosController(ProdutosService service){
        this.service = service;
    }
    @PostMapping("/post")
    public ResponseEntity<Object> save(@RequestBody @Valid ProdutosDto dto) {
        try {
            System.out.println(service.salvar(dto));
            return ResponseEntity.status(HttpStatus.CREATED).body("Reagistro Cadastrado com sucesso.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
    }
}
