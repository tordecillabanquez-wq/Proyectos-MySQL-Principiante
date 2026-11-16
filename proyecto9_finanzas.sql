-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2026 a las 12:40:50
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
-- Base de datos: `proyecto9_finanzas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_gasto`
--

CREATE TABLE `categorias_gasto` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `tipo` enum('Ingreso','Gasto') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categorias_gasto`
--

INSERT INTO `categorias_gasto` (`id_categoria`, `nombre`, `tipo`) VALUES
(1, 'Salario', 'Ingreso'),
(2, 'Alimentación', 'Gasto'),
(3, 'Transporte', 'Gasto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id_movimiento` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id_movimiento`, `id_categoria`, `monto`, `descripcion`, `fecha`) VALUES
(1, 1, 1500.00, 'Pago quincenal', '2026-11-01'),
(2, 2, 85.50, 'Compra supermercado', '2026-11-03'),
(3, 3, 25.00, 'Recarga tarjeta bus', '2026-11-05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias_gasto`
--
ALTER TABLE `categorias_gasto`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias_gasto`
--
ALTER TABLE `categorias_gasto`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_gasto` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
