package com.ProyectoWebRestaurante.service.impl;

import com.ProyectoWebRestaurante.domain.Plato;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ProyectoWebRestaurante.dao.PlatoDao;
import com.ProyectoWebRestaurante.service.PlatoService;

@Service
public class PlatoServiceImpl implements PlatoService {

    @Autowired
    private PlatoDao platoDao;

    @Override
    @Transactional(readOnly = true)
    public List<Plato> getPlatos(boolean disponible) {
        var lista = platoDao.findAll();
        if (disponible) { 
            lista.removeIf(c -> !c.isDisponible());

        }

        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Plato getPlato(Plato plato) {
        return platoDao.findById(plato.getIdPlato()).orElse(null);
    }

    @Override
    @Transactional
    public void save(Plato plato) {
        platoDao.save(plato);
    }

    @Override
    @Transactional
    public void delete(Plato plato) {
        platoDao.delete(plato);
    }

}
