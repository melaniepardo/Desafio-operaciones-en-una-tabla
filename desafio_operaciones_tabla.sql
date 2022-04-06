--Crear una base de datos con nombre “Posts”
CREATE DATABASE posts_db;
-- con \c nos vamos a la database post
\c
--Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,contenido y descripción
CREATE TABLE post(
    id SERIAL NOT NULL PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    fecha_creacion DATE NOT NULL,
    contenido VARCHAR(200) NOT NULL,
    descripcion VARCHAR(200) NOT NULL
);

-- Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion)
VALUES ('Pamela', '01-01-2020', 'mensaje', 'detalle');
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion)
VALUES ('Pamela', '01-01-2020', 'mensaje2', 'detalle2');
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion)
VALUES ('Carlos', '01-01-2020', 'mensaje', 'detalle');

-- Modificar la tabla post, agregando la columna título
ALTER TABLE post
ADD titulo VARCHAR(25);

-- 5. Agregar título a las publicaciones ya ingresadas.
UPDATE post SET titulo = 'titulo1' WHERE id = 1;
UPDATE post SET titulo = 'titulo2' WHERE id = 2;
UPDATE post SET titulo = 'titulo3' WHERE id = 3;
-- 6. Insertar 2 post para el usuario "Pedro".
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Pedro', '01-01-2020', 'mensaje1', 'detalle1', 'titulo');
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Pedro', '01-01-2020', 'mensaje2', 'detalle2', 'titulo');

-- 7. Eliminar el post de Carlos. (eliminaremos por id)
DELETE FROM post WHERE id = 3;
-- 8. Ingresar un nuevo post para el usuario "Carlos".
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Carlos', '01-01-2020', 'mensaje', 'detalle', 'titulo');

-- Parte 2
-- 1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts.
CREATE TABLE comentarios(
    id SERIAL NOT NULL PRIMARY KEY,
    post_id BIGINT NOT NULL,
    fecha DATE NOT NULL,
    hora_creacion VARCHAR(50) NOT NULL,
    contenido VARCHAR(200) NOT NULL,
    FOREIGN KEY (post_id) REFERENCES post(id)
);

-- 2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('1', '01-01-2020', '03:56', 'comentario1');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('2', '01-01-2020', '03:57', 'comentario2');

INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('6', '01-01-2020', '03:56', 'comentario1');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('6', '01-01-2020', '03:59', 'comentario2');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('6', '01-01-2020', '03:59', 'comentario3');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('6', '01-01-2020', '04:00', 'comentario4');


-- 3. Crear un nuevo post para "Margarita".
INSERT INTO post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Margarita', '01-01-2020', 'mensaje', 'detalle');

-- 4. Ingresar 5 comentarios para el post de Margarita.

INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('5', '01-01-2020', '03:56', 'comentario1');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('5', '01-01-2020', '03:56', 'comentario2');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('5', '01-01-2020', '03:57', 'comentario3');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('5', '01-01-2020', '04:56', 'comentario4');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('5', '01-01-2020', '05:56', 'comentario5');