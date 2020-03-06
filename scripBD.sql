DROP DATABASE gdlwebcamp;

CREATE DATABASE gdlwebcamp;

USE gdlwebcamp;


CREATE TABLE categoria_evento(
                    `id_categoria` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    `cat_evento` varchar(50) NOT NULL, /*categoria de evento*/
                    `icono` varchar(15) NOT NULL, /*icono de evento*/
                    `editado` datetime NOT NULL)
                    ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Insertando datos*/
INSERT INTO categoria_evento VALUES (NULL, 'Seminario', 'fa-university', CURRENT_TIMESTAMP());
INSERT INTO categoria_evento VALUES (NULL, 'Conferencias', 'fa-comment', CURRENT_TIMESTAMP());
INSERT INTO categoria_evento VALUES (NULL, 'Talleres', 'fa-code', CURRENT_TIMESTAMP());


CREATE TABLE invitados(
                    `id_invitado` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    `nombre_invitado` varchar(30) NOT NULL,
                    `apellido_invitado` varchar(30) NOT NULL,
                    `descripcion` text(600) NOT NULL,
                    `url_imagen` varchar(50)
                    )
                    ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO invitados VALUES (NULL, 'Rafael', 'Bautista', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Suscipit cumque optio architecto. Odit, natus perspiciatis nostrum excepturi fugiat an', 'invitado1.jpg');

INSERT INTO invitados VALUES (NULL, 'Shari', 'Herrera', 'sectetur adipisicing elit. Suscipit cumque optio architecto. Odit, natus perspiciatis nostrum excepturi fugiat an', 'invitado2.jpg');

INSERT INTO invitados VALUES (NULL, 'Gregorio', 'Sanchez', 'sectetur adipisicing elit. Suscipit cumque optio architecto. Odit, natus perspiciatis nostrum excepturi fugiat an', 'invitado3.jpg');

INSERT INTO invitados VALUES (NULL, 'Susana', 'Rivera', 'sectetur adipisicing elit. Suscipit cumque optio architecto. Odit, natus perspiciatis nostrum excepturi fugiat an', 'invitado4.jpg');

INSERT INTO invitados VALUES (NULL, 'Harold', 'Garcia', 'sectetur adipisicing elit. Suscipit cumque optio architecto. Odit, natus perspiciatis nostrum excepturi fugiat an', 'invitado5.jpg');

INSERT INTO invitados VALUES (NULL, 'Susan', 'Sanchez', 'sectetur adipisicing elit. Suscipit cumque optio architecto. Odit, natus perspiciatis nostrum excepturi fugiat an', 'invitado6.jpg');


CREATE TABLE eventos(
                    `id_evento` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    `nombre_evento` varchar(60) NOT NULL,
                    `fecha_evento` date NOT NULL,
                    `hora_evento` time NOT NULL,
                    `id_categoria` tinyint(10) UNSIGNED NOT NULL,
                    `id_invitado` tinyint(10) UNSIGNED NOT NULL,
                    `clave` varchar(10) NOT NULL,
                    `editado` datetime NOT NULL,
                    FOREIGN KEY (id_categoria) REFERENCES categoria_evento(id_categoria), /*FK*/
                    FOREIGN KEY (id_invitado) REFERENCES invitados(id_invitado)    
                    )
                    ENGINE=INNODB DEFAULT CHARSET=utf8;




/* CREACIÓN DE TABLA DE REGALOS */
/************************************************/
CREATE TABLE regalos(
                    `id_regalo` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    `nombre_regalo` varchar(50) NOT NULL
                    )
                    ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO regalos VALUES (NULL, 'Pulsera');
INSERT INTO regalos VALUES (NULL, 'Etiquetas');
INSERT INTO regalos VALUES (NULL, 'Plumas');


/* CREACIÓN DE TABLA PARA REGISTROS DE USUARIOS */
/**********************************************/
CREATE TABLE registrados(
                        `id_registrado` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        `nombre_registrado` varchar(50) NOT NULL,
                        `apellido_registrado` varchar(50) NOT NULL,
                        `email_registrado` varchar(100) NOT NULL,
                        `fecha_registro` datetime NOT NULL,
                        `pases_articulos` longtext NOT NULL,
                        `talleres_registrados` longtext NOT NULL,
                        `regalo` int(11) UNSIGNED,
                        `pagado` int(1) UNSIGNED, /*0 no pagado, 1 pagado.*/
                        `total_pagado` varchar(50) NOT NULL,

                        FOREIGN KEY (regalo) REFERENCES regalos(id_regalo) /*FK*/
                        )
                        ENGINE=INNODB DEFAULT CHARSET=utf8;



/* CREACIÓN DE TABLA PARA REGISTROS DE ADMINISTRADORES*/
/*****************************************************/
CREATE TABLE administradores(
                            `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                            `usuario` varchar(50) NOT NULL UNIQUE,
                            `nombre` varchar(100) NOT NULL,
                            `contrasenia` varchar(60) NOT NULL,
                            `editado` datetime NOT NULL,
                            `nivel` int(1) NOT NULL
                            )
                            ENGINE=INNODB DEFAULT CHARSET=utf8;