package com.ProyectoWebRestaurante.controller;



import com.ProyectoWebRestaurante.domain.Categoria;
import com.ProyectoWebRestaurante.service.CategoriaService;
import com.ProyectoWebRestaurante.service.PlatoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/navegar")
public class NavegarController {

    @Autowired
    private PlatoService platoService;
    @Autowired
    private CategoriaService categoriaService;

    @GetMapping("/listado")
    public String listado(Model model) {
        var lista = platoService.getPlatos(false);
        model.addAttribute("platos", lista);

        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("categorias", categorias);

        return "/navegar/listado";

    }

    @GetMapping("/listado/{idCategoria}")
    public String modifica(Categoria categoria, Model model) {
        categoria = categoriaService.getCategoria(categoria);
        var lista = categoria.getPlatos();
        model.addAttribute("platos", lista);
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("categorias", categorias);

        return "/navegar/listado";
    }

    @GetMapping("/listado2")
    public String listado2(Model model) {
        var lista = platoService.getPlatos(false);
        model.addAttribute("platos", lista);

        return "/navegar/listado2";

    }

    @PostMapping("/query1")
    public String consultaJPA(
            @RequestParam(value = "precioInf") double precioInf,
            @RequestParam(value = "precioSup") double precioSup,
            Model model) {
        var lista = platoService.consultaJPA(precioInf, precioSup);
        model.addAttribute("platos", lista);
        model.addAttribute("precioInf", precioInf);
        model.addAttribute("precioSup", precioSup);

        return "/navegar/listado2";

    }
    
}