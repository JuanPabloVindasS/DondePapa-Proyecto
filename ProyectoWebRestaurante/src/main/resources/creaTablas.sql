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

create table DondePapa.plato (
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

INSERT INTO DondePapa.categoria (descripcion, disponible, ruta_imagen) VALUES 
('César con quesito parmesano y cuadrito de pan tostado con nuestro pollo grill.', true, 'https://live.staticflickr.com/7116/7697144664_ed1affb199_b.jpg'),
('Caprese ensalada italiana de san pelegrino resaltada por rodajas de tomate y el sabor de la albahaca fresca.', true, 'https://deliciaskitchen.b-cdn.net/wp-content/uploads/2022/07/ensalada-caprese-receta-original-italiana.jpg'),
('PESCADO ENSALADA CON CUADRITOS DE PAN TOSTADO CON NUESTRO PESCADO EMPANIZADO, AL AJILLO O GRILL', true, 'https://assets.unileversolutions.com/recipes-v2/219298.jpg'),
('Azteca la sopa de tomate por excelencia traída directo de méxico por papá.', true, 'https://keviniscooking.com/wp-content/uploads/2023/01/Chicken-Tortilla-Soup-Sopa-Azteca-square.jpg'),
('SOPA mariscos compuesta por mariscos frescos, y el toque esencial de papá.', true, 'https://realdeoaxaca.com/cdn/shop/products/IMG_1060_2000x.jpg?v=1502715569'),
('Carne esencia de carne con el objetivo de plasmar su sabor en tu paladar.', true, 'https://www.cook2eatwell.com/wp-content/uploads/2018/05/sopa-de-res-image-2.jpg'),
('Pollo para sacarnos de cualquier apuro, la sopa curativa clásica.', true, 'https://images.hola.com/imagenes/cocina/recetas/20171013100547/receta-sopa-pollo/0-741-140/sopa-pollo-m.jpg'),
('Rabo sacando lo mejor de los ingredientes traemos la sopa preferida de papá.', true, 'https://rumbameats.com/wp-content/uploads/2019/07/Hervido-de-_rabo-by-enrilemoine-7.jpg'),
('Mondongo Sopa tradicional de la tierra costarricense para un antojo de antaño.', true, 'https://www.mycolombianrecipes.com/wp-content/uploads/2010/05/Mondongo.jpg'),
('Pollo con pan ciabatta, nuestro sándwich de pollo, lechuga, tomate y deliciosas salsas clásicas.', true, 'https://www.paulinacocina.net/wp-content/uploads/2023/06/panes-con-pollo-receta.jpg'),
('Jamón y queso con pan ciabatta, nuestro sándwich de jamón y queso, lechuga, tomate y deliciosas salsas clásicas.', true, 'https://hips.hearstapps.com/hmg-prod/images/panini-sandwiches-royalty-free-image-1588773746.jpg'),
('Carne con pan ciabatta, nuestro sándwich de carne, lechuga, tomate y deliciosas salsas clásicas.', true, 'https://www.ciabattagourmet.com/img/portfolio/mechada-large.jpg'),
('Pollo y bacon wrap relleno de pollo empanizado, delicioso tocino y nuestra salsa mayonesa chipotle.', true, 'https://www.gourmet.cl/wp-content/uploads/2016/09/wrap-de-pollo.jpg-editada.jpg'),
('Corvina wrap con pescado empanizado y nuestra clásica salsa tártara.', true, 'https://7diasdesabor.com/wp-content/uploads/2021/09/1078da354a0b35d473e8954dac5afd3f168.jpg'),
('Quesadillas mixta mezcla de los dos mundos, pollo y carne en uno solo.', true, 'https://i.redd.it/mo8qbrw4dfb21.jpg'),
('Pollo o carne con dos quesos, mozzarella y cheddar, disfrútalas como quieras!', true, 'https://restaurantzasha.cl/wp-content/uploads/2021/06/quesadilla-mixta.jpg'),
('CRÊPE DE POLLO DELICIOSA CREPA DE POLLO EN SU SALSA BLANCA.', true, 'https://www.recetasnestle.com.co/sites/default/files/srh_recipes/14c5f883b508e3d7a65bb808e9af41bd.jpg');

INSERT INTO DondePapa.categoria (descripcion, disponible, ruta_imagen) VALUES 
('Casados Clásico plato que todos los ticos reconocemos, salvador de tandas, escoge entre mechada, pescado, pollo, chuleta o BISTEC.', true, 'https://mijnreiservaring.nl/wp-content/uploads/2017/11/Casodos.jpg'),
('Chifrijo Para los amantes de la combinación del chicharrón, frijoles y arroz, servido con el clásico oro verde y tortillitas para que amarre.', true, 'https://www.puravidamoms.com/wp-content/uploads/2020/02/costa-rican-chifrijo-recipe.jpg'),
('Chicharrones EL SABOR DE PURISCAL hasta tu mesa, servido con yuca frita y ensalada a lo tico.', true, 'https://i0.wp.com/fortheloveofsazon.com/wp-content/uploads/2020/02/IMG_3218.jpg?resize=750%2C500&ssl=1'),
('LENGUA EN SALSA ATRÉVETE A PROBAR NUESTRA SUAVE LENGUA EN SALSA DE TOMATE, CALLA HASTA LOS MÁS BOCONES CON SU SABOR.', true, 'https://www.comedera.com/wp-content/uploads/2022/10/Lengua-de-ternera-en-salsa-shutterstock_1277841961.jpg'),
('CHILE RELLENO RELLENO DE CARNE MOLIDA, UN EXCELENTE PLATO PARA EL BUEN TICO.', true, 'https://eatingrichly.com/wp-content/uploads/2018/06/chiles-relleno-authentic-2032-735x1103.jpg'),
('Patitas de cerdo Patitas de cerdo con frijolitos blancos, plato lleno de puro sabor donde mi tata!', true, 'https://cdn0.recetasgratis.net/es/posts/3/4/0/patas_de_cerdo_con_maiz_21043_orig.jpg'),
('Patacones Perfecto para quitarse esas ganas de comer a lo tico, nuestros patacones vienen con carne mechada, frijoles molidos y pico de gallo.', true, 'https://www.panningtheglobe.com/wp-content/uploads/2023/03/patacones-sq.jpg'),
('Rice n´ beans Limón presente en el menú de papá, pollo en salsa caribeña con ensalada y maduros con el inigualable rice and beans!', true, 'https://www.africanbites.com/wp-content/uploads/2014/02/Cariibean-Rice-and-Beans-650x650.jpg');

INSERT INTO DondePapa.categoria (descripcion, disponible, ruta_imagen) 
VALUES 
('Carne arroz directo de la casa compuesto por una combinación perfecta de arroz y carne.', true,'https://i.ytimg.com/vi/jJrsrTsuNh4/maxresdefault.jpg'),
('Pollo arroz con el pollo desmechado clásico haciendo de este un plato típico delicioso.', true,'https://i.ytimg.com/vi/wtFpaW7VXag/maxresdefault.jpg'),
('Marinera elaborado con los mariscos más frescos seleccionados por papá.', true,'https://i.blogs.es/c6b6ab/marineras2/840_560.jpg'),
('Camarones arroz con camarones de alta calidad para saciar los paladares hambrientos.', true,'https://www.unileverfoodsolutionslatam.com/dam/global-ufs/mcos/nola/cam/calcmenu/recipes/CR-recipes/rice-dishes/arroz-con-camarones/main-header.jpg'),
('Pomodoro Nuestra pasta en salsa de tomate con delicioso queso mozzarela.', true,'https://st.depositphotos.com/1003814/3345/i/450/depositphotos_33455217-stock-photo-pasta-with-tomato-sauce-and.jpg'),
('Bolognese deliciosa pasta con queso mozzarela, salsa de tomate y carne molida. ', true,'https://www.unileverfoodsolutionslatam.com/dam/global-ufs/mcos/nola/cam/calcmenu/recipes/CR-recipes/rice-dishes/arroz-con-camarones/main-header.jpg'),
('Marinera salsa de tomate o salsa blanca con mariscos o solo camarones.', true,'https://img-global.cpcdn.com/recipes/recipes_183381_v1430139166_receta_foto_00183381-g0ahhyottkhkctptqofb/400x400cq70/photo.jpg'),
('Alfredo pasta con jamón y hongos en salsa blanca.', true,'https://images.aws.nestle.recipes/resized/cc72869fabfc2bdfa036fd1fe0e2bad8_creamy_alfredo_pasta_long_left_1080_850.jpg'),
('Filet de corvina filet de corvina al grill, al ajillo o empanizado.', true,'https://media-cdn.tripadvisor.com/media/photo-s/13/86/a8/a4/filet-de-corvina-a-la.jpg'),
('Corvina entera nuestra especial corvina entera sin espinas lista para ti.', true,'https://media-cdn.tripadvisor.com/media/photo-m/1280/18/2f/ec/5f/corvina-entera-frita.jpg'),
('Pargo enteropargo entero fresco para los que quieran recordar los días de playa', true, 'https://img-global.cpcdn.com/recipes/4438f624f48d8357/400x400cq70/photo.jpg'),
('Corvina entera nuestra especial corvina entera acompañada de salsa caribeña y camarones.', true, 'true,'https://media-cdn.tripadvisor.com/media/photo-m/1280/18/2f/ec/5f/corvina-entera-frita.jpg'),
('Camarones jugosos camarones empanizados o al ajillo para los fanáticos del mar.', true, 'https://cdn0.recetasgratis.net/es/posts/5/7/6/camarones_a_la_mantequilla_35675_orig.jpg'),
('Mejillones mejillones noruegos al ajillo seleccionados por papá', true, 'https://i.blogs.es/6c8641/mejillones-20escabeche-dap/450_1000.jpg'),
('Mariscada mix de mariscos frescos cocinados al ajillo creando un platillo colorido.', true, 'https://buenprovecho.hn/wp-content/uploads/2020/02/Mariscos-fritos.jpg');


INSERT INTO DondePapa.categoria (descripcion, disponible, ruta_imagen) 
VALUES 
('Pollo al grill Nuestro especial pollo, tratado por la mano de nuestros chefs, a la parrilla!', true, 'https://mujer.com.mx/cdn/recipes/pollo-grill-01.jpg'),
('Pollo pollo parrillero con ganas de más fuego, bañado en nuestra salsa especial de jalapeños.', true, 'https://www.clarin.com/img/2022/03/22/24IGZl6uG_2000x1500__1.jpg'),
('Cordon bleu nuestro pollo en un platillo fabuloso, cordon bleu bañado en salsa blanca.', true, 'https://cdn.recetasderechupete.com/wp-content/uploads/2017/09/Cordon-bleu-de-pollo.jpg'),
('La de papá exquisita hamburguesa de papá, pulled pork bbq, pepinillos, bacon, aros de cebolla.', true, 'https://www.recetasnestle.com.ec/sites/default/files/srh_recipes/4e4293857c03d819e4ae51de1e86d66a.jpg'),
('Pollo Una de las mejores hamburguesas para los fans del pollo a la parrilla.', true, 'https://www.comedera.com/wp-content/uploads/2023/07/Hamburguesa-de-pollo-picante.jpg'),
('Cheeseburger Hamburguesa con queso papá, para saborear a gusto.', true,'https://www.recipetineats.com/wp-content/uploads/2022/08/Stack-of-cheeseburgers.jpg')
('Fish sandwich Hamburgesa de pescado con salsa tartara, lechuga y queso amarillo, solo... donde papa, true,'https://www.southernliving.com/thmb/fAHaDY1jvEDI0r59bHrngHCgN1Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/27441_BeachEats_6330_MAIN_preview-aec5fec9ebb3445388b921a5eca2f9d4.jpg')
('Costilla costilla de cerdo cocinada especialmente 3 horas por nuestros chefs.', true,'https://s1.eestatic.com/2020/10/19/actualidad/actualidad_529458467_162982737_1706x960.jpg')
('Churrasco Este delicioso corte proviene de la falda de la res transversalmente, tratado por papá.', true,'https://boquisabroso.com.co/wp-content/uploads/2023/03/Receta-de-Churrasco-Colombiano.jpg')
('Churrasco churrasco en nuestra salsa especial a la jalapeña para darle su perfecto toque spicy.', true,'https://boquisabroso.com.co/wp-content/uploads/2023/03/Receta-de-Churrasco-Colombiano.jpg')
('Lomito Destacado por su suavidad natural, este corte de caracteíisticas jugosas puede saciar a cualquiera!', true,'https://enmicasa.com/wp-content/uploads/2010/01/lomito-con-cafe-y-chile-guaque-1-sq.jpg')
('Lomito Para aquellos que quieran probar la parrilla de papá, el suave lomito en combinaciótn con nuestro toque a la jalapeña.', true,'https://enmicasa.com/wp-content/uploads/2010/01/lomito-con-cafe-y-chile-guaque-1-sq.jpg')
('Puré', true,'https://cocinemosjuntos.com.co/media/mageplaza/blog/post/r/e/recetas-sencillas-y-deliciosas-de-pure-de-papa_1_.jpg')
('Vegetales', true,'https://i.ytimg.com/vi/YuJqH2lS_ZE/hqdefault.jpg')
('Papas asadas', true,'https://www.gourmet.cl/wp-content/uploads/2014/09/Papas-Asadas.jpg')
('Arroz', true,'https://s2.abcstatics.com/media/bienestar/2020/08/26/arroz-blanco-kUXE--1248x698@abc.jpg')
('Papas fritas', true, 'https://phantom-marca.unidadeditorial.es/813d16708dc72860fd3cf319c9a245b5/resize/828/f/jpg/assets/multimedia/imagenes/2023/08/04/16911461030527.jpg');