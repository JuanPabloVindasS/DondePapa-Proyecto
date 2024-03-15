package com.ProyectoWebRestaurante.dao;

import com.ProyectoWebRestaurante.domain.Plato;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PlatoDao
        extends JpaRepository<Plato,Long> {
    
}
