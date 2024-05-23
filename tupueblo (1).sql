-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2024 a las 11:41:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tupueblo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id` int(11) NOT NULL,
  `pueblo_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id`, `pueblo_id`, `nombre`, `descripcion`, `imagen`) VALUES
(1, 1, 'Caminito del Rey', 'Sumérgete en una aventura única...', 'https://images.ecestaticos.com/Rmzh9lQlePu4lDYv8Kq6hmXXrNs=/0x0:2125x1410/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F6a9%2Fc05%2F9d4%2F6a9c059d4bc3a78916df57a2ebf6a5de.jpg'),
(2, 1, 'El torcal', 'Un paisaje único de rocas calizas...', 'https://www.torcaldeantequera.com/wp-content/uploads/2022/12/Rutas-por-libre-scaled.jpg'),
(3, 1, 'Dólmenes', 'Adentrate en la historia ancestral de los dolmenes...', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Dolmen_de_Menga_Antequera.JPG/1280px-Dolmen_de_Menga_Antequera.JPG'),
(4, 1, 'Alcazaba', 'Explora la majestuosidad de la Alcazaba...', 'https://fotografias.lasexta.com/clipping/cmsimages02/2023/03/25/C6498447-EA54-49DE-93C4-046120A66CE6/antequera_58.jpg?crop=960,544,x0,y46&width=1000&height=567&optimize=high&format=webply'),
(5, 1, 'Villa Romana', 'Descubre el legado romano de Antequera...', 'https://www.antequera.es/export/shared/.galleries/IMAGENES-Noticias/2023/03/mbaron_villaromana-27032023-6.jpg'),
(6, 2, 'Orquidario', 'Una parada obligatoria para los amantes de las plantas...', 'https://static.costadelsolmalaga.org/malaga/subidas/imagenes/0/2/arc_306720_g.jpg'),
(7, 2, 'Senda Litoral', 'Un sendero que no solo te permitirá recorrer la costa a pie o en bici...', 'https://turismo.estepona.es/wp-content/uploads/2020/05/2773_19-Punta-Plata-77.jpg'),
(8, 2, 'Murales', 'Si una actividad es icónica para este pueblo, además de su famoso tobogán, son los murales de diferentes artistas que lo decoran...', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/84/cd/cf/fabulous-mural.jpg?w=1200&h=-1&s=1'),
(9, 2, 'Selwo Aventura', 'Si te gustan los animales este es tu sitio...', 'https://www.transfersandexperiences.com/blog/wp-content/uploads/2019/12/Selwo-Aventura.png'),
(10, 2, 'Mirador del Carmen', 'Que no os engañe el nombre, pues este mirador esconde mucho más...', 'https://s2.abcstatics.com/abc/www/multimedia/espana/2023/03/30/mirador-carmen-paseo-RwF5JbxuztTbKzvEwnZ9VPO-1200x840@abc.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pueblos`
--

CREATE TABLE `pueblos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `coordenadas` point DEFAULT NULL,
  `imagenes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`imagenes`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pueblos`
--

INSERT INTO `pueblos` (`id`, `nombre`, `descripcion`, `coordenadas`, `imagenes`) VALUES
(1, 'Antequera', 'Sumérgete en la rica historia de Antequera...', 0x0000000001010000003d0ad7a3703d12c027c286a757824240, '[\n        \"https://static.costadelsolmalaga.org/visita/subidas/imagenes/0/3/arc_30430_g.jpg\",\n        \"https://cloud.inspain.org/imgwbp/sitios/4/9/5/5yy2j2xkfktfu5dtvdn3s3jmfy_2000.webp\",\n        \"https://www.revistaoxigeno.es/uploads/s1/82/64/08/2/torcal-2.jpeg\",\n        \"https://static.costadelsolmalaga.org/visita/subidas/imagenes/0/6/arc_25060_g.jpg\"\n    ]'),
(2, 'Estepona', 'Adéntrate en los encantos de este pueblo costero que cada vez se hace más sonar...', 0x000000000101000000e63fa4dfbe8e14c02d211ff46c364240, '[\r\n        \"https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcRamBnSIzGI0CGaIhq9eYQjEzw6GTEYKP-ZstpaBIvyS-UWAT7nefBiTvaBJ2QNTim_QhexTMxXBpN0mngAWSxKLSGRVjZdaVfjLdJUwg\",\r\n        \"https://marinasdeandalucia.com/files/gallery/image/1511354671-puerto-deportivo-estepona-torre.jpg\",\r\n        \"https://www.villasfincas.com/wp-content/uploads/2013/10/n-chaplow-8-scaled.jpg\",\r\n        \"https://www.turismomarinero.com/wp-content/uploads/2015/06/casco-hist%C3%B3rico-de-Estepona-e1433428102568.jpg\"\r\n    ]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `contrasena`) VALUES
(1, 'tupueblo@admin.com', '1234'),
(12, 'juanmanolo', '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pueblo_id` (`pueblo_id`);

--
-- Indices de la tabla `pueblos`
--
ALTER TABLE `pueblos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pueblos`
--
ALTER TABLE `pueblos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`pueblo_id`) REFERENCES `pueblos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
