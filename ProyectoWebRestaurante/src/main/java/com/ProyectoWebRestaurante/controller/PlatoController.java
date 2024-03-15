package com.ProyectoWebRestaurante.controller;

import com.ProyectoWebRestaurante.domain.Plato;
import com.ProyectoWebRestaurante.service.PlatoService;
import com.ProyectoWebRestaurante.service.FirebaseStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/plato")
public class PlatoController {

    @Autowired
    private PlatoService platoService;
    @Autowired
    private FirebaseStorageService firebaseStorageService;

    @GetMapping("/listado")
    public String listado(Model model) {
        var lista = platoService.getPlatos(false);
        model.addAttribute("platos", lista);
        model.addAttribute("totalPlatos", lista.size());
        model.addAttribute("plato", new Plato()); // Add this line
        return "/plato/listado";
    }

    @PostMapping("/guardar")
    public String save(Plato plato,
            @RequestParam("imagenFile") MultipartFile imagenFile) {
        // Primero, guardamos la categoría para asegurarnos de que tenga un ID.
        platoService.save(plato);

        // Verificamos si hay una imagen para subir.
        if (!imagenFile.isEmpty()) {
            // Subimos la imagen a Firebase Storage y obtenemos la ruta.
            String ruta = firebaseStorageService.cargaImagen(imagenFile, "plato", plato.getIdPlato());

            // Establecemos la ruta de la imagen en la categoría y la guardamos nuevamente.
            plato.setRutaImagen(ruta);
            platoService.save(plato);
        }

        // Redireccionamos al listado de categorías.
        return "redirect:/plato/listado";
    }

    @GetMapping("/modificar/{idPlato}")
    public String modifica(Plato plato, Model model) {
        plato = platoService.getPlato(plato);
        model.addAttribute("plato", plato);
        return "plato/modifica";
    }

    @GetMapping("/eliminar/{idPlato}")
    public String elimina(Plato plato) {
        platoService.delete(plato);
        return "redirect:/plato/listado";
    }

}
