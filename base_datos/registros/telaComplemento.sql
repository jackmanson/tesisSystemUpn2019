-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: custsql-ipg118.eigbox.net
-- Tiempo de generación: 05-01-2020 a las 17:14:44
-- Versión del servidor: 5.6.41-84.1-log
-- Versión de PHP: 7.0.33-0ubuntu0.16.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_monely`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telaComplemento`
--

CREATE TABLE `telaComplemento` (
  `id_telaComplemento` int(11) NOT NULL,
  `nombre_telacomplemento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `telaComplemento`
--

INSERT INTO `telaComplemento` (`id_telaComplemento`, `nombre_telacomplemento`) VALUES
(1, 'Rib 1x1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `telaComplemento`
--
ALTER TABLE `telaComplemento`
  ADD PRIMARY KEY (`id_telaComplemento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `telaComplemento`
--
ALTER TABLE `telaComplemento`
  MODIFY `id_telaComplemento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
