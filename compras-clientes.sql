-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2023 a las 18:53:21
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `compras-clientes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_dni` int(10) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_dni`, `apellido`, `nombre`) VALUES
(389148, 'Washington', 'George'),
(745549, 'Giordano', 'Roberto'),
(751645, 'Karadagian', 'Martín'),
(4135264, 'Farías', 'Dringue'),
(42935925, 'Smart', 'Maxwell'),
(45687979, 'Chaplin', 'Charles'),
(46871678, 'Caballo', 'Celeste R3'),
(85205203, 'Arias', 'Pepe'),
(246846151, 'Orejudo', 'El Petiso'),
(1548451651, 'Bonaparte', 'Napoleón'),
(1548451652, 'Leblanc', 'Libertad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `id_compras`
--

CREATE TABLE `id_compras` (
  `id_compras` int(30) NOT NULL,
  `dni_id` int(20) NOT NULL,
  `concepto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `id_compras`
--

INSERT INTO `id_compras` (`id_compras`, `dni_id`, `concepto`) VALUES
(1, 85205203, 'telescopio'),
(2, 1548451651, 'bolsillo'),
(3, 46871678, 'guitarra'),
(4, 45687979, 'bastón nuevo'),
(5, 745549, 'casco'),
(6, 751645, 'ratisalil'),
(7, 42935925, 'zapatófono 5G'),
(8, 246846151, 'careta'),
(9, 1548451652, 'corpiño xxxl');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_compras`
--

CREATE TABLE `lineas_compras` (
  `numero_id` int(20) NOT NULL,
  `compras_id` int(20) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineas_compras`
--

INSERT INTO `lineas_compras` (`numero_id`, `compras_id`, `producto`, `importe`) VALUES
(1, 4, 'marca no te caigas', 1.25),
(2, 5, 'bell', 2.3),
(3, 3, 'sin cuerdas', 2.3),
(4, 6, 'pomada', 100),
(5, 7, 'motorola', 50),
(6, 8, 'Francisco', 1.1),
(7, 9, 'marca orgullo', 1.25);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_dni`);

--
-- Indices de la tabla `id_compras`
--
ALTER TABLE `id_compras`
  ADD PRIMARY KEY (`id_compras`),
  ADD KEY `id_dni` (`dni_id`);

--
-- Indices de la tabla `lineas_compras`
--
ALTER TABLE `lineas_compras`
  ADD PRIMARY KEY (`numero_id`),
  ADD KEY `id_compras` (`compras_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `id_compras`
--
ALTER TABLE `id_compras`
  MODIFY `id_compras` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `lineas_compras`
--
ALTER TABLE `lineas_compras`
  MODIFY `numero_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `id_compras`
--
ALTER TABLE `id_compras`
  ADD CONSTRAINT `id_compras_ibfk_1` FOREIGN KEY (`dni_id`) REFERENCES `clientes` (`id_dni`);

--
-- Filtros para la tabla `lineas_compras`
--
ALTER TABLE `lineas_compras`
  ADD CONSTRAINT `lineas_compras_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `id_compras` (`id_compras`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
