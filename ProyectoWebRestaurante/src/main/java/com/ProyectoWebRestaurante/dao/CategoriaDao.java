package com.ProyectoWebRestaurante.dao;

import com.ProyectoWebRestaurante.domain.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoriaDao
        extends JpaRepository<Categoria,Long> {
    
}
