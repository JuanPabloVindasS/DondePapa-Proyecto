package com.ProyectoWebRestaurante.domain;

import jakarta.persistence.*;
import java.io.Serializable;

import lombok.Data;

@Data
@Entity
@Table(name = "plato")
public class Plato implements Serializable {

    private static final long serialVersionUID = 1L; // Se declara nada más 

    @Id //Se define el campo clave
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_plato")
    private Long idPlato;
    private String descripcion;
    private double precio;
    private int existencias;
    private int categoria;
    private boolean disponible;

    private String rutaImagen;

}
/*
CREATE TABLE DondePapa.platos (
    id_plato INT PRIMARY KEY,
    descripcion VARCHAR(255),
    precio DECIMAL(10, 2),
    existencias INT,
    total_producto INT,
    categoria INT,
    disponible BOOLEAN,
    FOREIGN KEY (categoria) REFERENCES categorias(id_categoria)
);
 */
