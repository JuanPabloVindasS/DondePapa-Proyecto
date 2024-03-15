DROP SCHEMA IF EXISTS DondePapa;
DROP USER IF EXISTS 'userDondePapa'@'%';

CREATE SCHEMA DondePapa;
CREATE USER 'userDondePapa'@'%' IDENTIFIED BY 'CntrDondePapa.';
GRANT ALL PRIVILEGES ON DondePapa.* TO 'userDondePapa'@'%';
FLUSH PRIVILEGES;

CREATE TABLE DondePapa.categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255),
    disponible BOOLEAN,
    ruta_imagen VARCHAR(1024)
);

CREATE TABLE DondePapa.plato (
    id_plato INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255),
    precio DECIMAL(10, 2),
    existencias INT,
    total_producto INT,
    categoria INT,
    disponible BOOLEAN,
    ruta_imagen VARCHAR(1024),
    FOREIGN KEY (categoria) REFERENCES DondePapa.categoria(id_categoria)
);

-- ...
CREATE TABLE DondePapa.reservacion (
    id_reservacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    hora TIME,
    numero_de_mesa INT,
    contacto VARCHAR(255)  
);

INSERT INTO DondePapa.categoria (descripcion, disponible, ruta_imagen) VALUES 
('Desayuno', true, 'https://content.clara.es/medio/2023/04/10/cenas-saludables_d783748b_230410125848_1280x1376.jpg'),
('Almuerzo', true, 'https://www.gourmet.com.co/wp-content/uploads/2020/08/almuerzo-saludable-imagen-destacada.jpg'),
('Postre', true, 'https://imag.bonviveur.com/postre-pijama.jpg'); 


INSERT INTO DondePapa.reservacion (nombre, hora, numero_de_mesa, contacto) VALUES 
('Juan', '14:30:00', 1, '88269654'),
('María', '13:00:00', 2, '88269655'),
('José', '20:00:00', 3, '88269656');


