-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2026 a las 12:40:24
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
-- Base de datos: `proyecto7_biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lectores`
--

CREATE TABLE `lectores` (
  `id_lector` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `grado_curso` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lectores`
--

INSERT INTO `lectores` (`id_lector`, `nombre`, `grado_curso`) VALUES
(1, 'Valeria Ruiz', '10° Grado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `ejemplares_disponibles` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `isbn`, `titulo`, `autor`, `ejemplares_disponibles`) VALUES
(1, '978-0307474728', 'Cien años de soledad', 'Gabriel García Márquez', 3),
(2, '978-8497592208', 'El Principito', 'Antoine de Saint-Exupéry', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamo` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `id_lector` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion_estimada` date NOT NULL,
  `devuelto` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_prestamo`, `id_libro`, `id_lector`, `fecha_prestamo`, `fecha_devolucion_estimada`, `devuelto`) VALUES
(1, 1, 1, '2026-11-10', '2026-11-24', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `lectores`
--
ALTER TABLE `lectores`
  ADD PRIMARY KEY (`id_lector`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`),
  ADD UNIQUE KEY `isbn` (`isbn`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_libro` (`id_libro`),
  ADD KEY `id_lector` (`id_lector`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `lectores`
--
ALTER TABLE `lectores`
  MODIFY `id_lector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_lector`) REFERENCES `lectores` (`id_lector`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
