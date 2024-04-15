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
  id_plato INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(255) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio double, 
  ruta_imagen varchar(1024),
  disponible bool,
  PRIMARY KEY (id_plato),
  foreign key fk_producto_caregoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE DondePapa.reservacion (
    id_reservacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    hora TIME,
    numero_de_mesa INT,
    contacto VARCHAR(255)  
);

/*Se crea la tabla de clientes llamada cliente... igual que la clase Cliente */
CREATE TABLE DondePapa.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(1024) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se crea la tabla de rol llamada rol... igual que la clase rol */
create table DondePapa.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO DondePapa.categoria (descripcion, disponible, ruta_imagen) VALUES 
('Desayuno', true, 'https://content.clara.es/medio/2023/04/10/cenas-saludables_d783748b_230410125848_1280x1376.jpg'),
('Almuerzo', true, 'https://www.gourmet.com.co/wp-content/uploads/2020/08/almuerzo-saludable-imagen-destacada.jpg'),
('Postre', true, 'https://imag.bonviveur.com/postre-pijama.jpg'),
('Platos Ligeros', true, 'https://i.blogs.es/13051b/ensalada-de-aguacate-fresas-y-mozzarella/450_1000.jpg'),
('Sopas', true, 'https://images.hola.com/imagenes/cocina/noticiaslibros/20220118202821/recetas-sopas-rapidas-y-faciles/1-40-212/interior-sopas-adobe-a.jpg'),
('Sándwiches y Wraps', true, 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Cranberry-Turkey-Wraps_EXPS_HCA18_27665_D02_22_11b-1.jpg'),
('Quesadillas', true, 'https://upload.wikimedia.org/wikipedia/commons/7/75/Quesadilla_2.jpg'),
('Comida Típica', true, 'https://i.pinimg.com/1200x/59/94/af/5994afd4b6127aff53252f266b4f6f5d.jpg'),
('Platos Principales', true, 'https://images.hola.com/imagenes/cocina/noticiaslibros/20231218245109/mejores-platos-principales-para-navidad/1-349-681/solomillo-p-t.jpg'),
('Carnes y Grill', true, 'https://www.tresjotas.com/wp-content/uploads/2018/03/saber-termino-de-la-carne.jpg'),
('Mariscos', true, 'https://www.comedera.com/wp-content/uploads/2023/09/Cazuela-de-mariscos-shutterstock_1836014740.jpg'),
('Bebidas', true, 'https://www.coca-cola.com/content/dam/onexp/es/es/body/sostenibilidad/nuestros-productos/compania-total-de-bebidas/compania-total-bebidas.jpg'),
('Boquitas y Entradas', true, 'https://www.eventos299.com/wp-content/uploads/2023/08/WhatsApp-Image-2023-08-19-at-10.30.05-1024x647.jpeg');

/*Se insertan 3 registros en la tabla cliente como ejemplo */
INSERT INTO DondePapa.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'juan','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Juan', 'Castro Mora',    'jcastro@gmail.com',    '4556-8978', 'https://img.freepik.com/foto-gratis/chico-guapo-seguro-posando-contra-pared-blanca_176420-32936.jpg',true),
(2,'lafit','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Chuty',  'Villalobos', 'chutyvillalobos@gmail.com', '5456-8789','https://pbs.twimg.com/media/EahiQBxX0AEud1m.jpg',true),
(3,'allan','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Allan', 'Allan Loria',     'allanlafit@gmail.com',      '7898-8936','https://www.diarioextra.com/files/Dnews/images/detail/500526_allanvillalobos.jpg',true);



INSERT INTO DondePapa.reservacion (nombre, hora, numero_de_mesa, contacto) VALUES 
('Juan', '14:30:00', 1, '88269654'),
('María', '13:00:00', 2, '88269655'),
('José', '20:00:00', 3, '88269656');


INSERT INTO DondePapa.plato (descripcion, detalle, precio, id_categoria, disponible, ruta_imagen) VALUES 
('Wrap Pollo y Bacon', 'Wrap relleno de pollo empanizado con delicioso tocino y salsa mayonesa chipotle', 4000, 6 , true, 'https://i.pinimg.com/736x/72/86/1b/72861baeaccca244bf2fee091a7dc675.jpg'),
('Wrap Corvina', 'Wrap con pescado empanizado y nuestra clásica salsa tártara', 4500, 6, true, 'https://www.recetas.com.pa/sites/default/files/2017-02/tacos.jpg'),
('Quesadilla Pollo o Carne', 'Con dos quesos mozzarella y cheddar', 3700, 7, true, 'https://i.ytimg.com/vi/9Yy9JIvi0_U/maxresdefault.jpg'),
('Quesadilla Mixta', 'Mezcla de los dos mundos, pollo y carne en uno solo', 4000, 7, true, 'https://i.ytimg.com/vi/LpyDq325PcQ/hqdefault.jpg'),
('Crepe de Pollo', 'Deliciosa crepa de pollo en su salsa blanca', 4000, 9, true, 'https://www.recetasnestle.com.co/sites/default/files/srh_recipes/14c5f883b508e3d7a65bb808e9af41bd.jpg'),
('Casado', 'Clásico plato tico con opción de carne mechada, pescado, pollo, chuleta o bistec', 3500, 8, true, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Casado_costarricense.png/800px-Casado_costarricense.png'),
('Chifrijo', 'Combinación de chicharrón, frijoles y arroz', 3500,4, true, 'https://www.puravidamoms.com/wp-content/uploads/2020/02/costa-rican-chifrijo-recipe.jpg');


insert into Dondepapa.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1), (2,'ROLE_VENDEDOR',1), (3,'ROLE_USER',1),
 (4,'ROLE_VENDEDOR',2), (5,'ROLE_USER',2),
 (6,'ROLE_USER',3);