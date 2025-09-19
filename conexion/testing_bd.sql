-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2025 a las 02:11:39
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `testing_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `nombre_organizacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `nombre_organizacion`) VALUES
(6, 'Administracion', 'Organización Ejemplo A'),
(3, 'Gerencia', 'Organización Ejemplo A'),
(2, 'RRHH', 'Organización Ejemplo A'),
(4, 'Sistemas', 'Organización Ejemplo A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `dni` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `nombre_dpto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`dni`, `nombre`, `nombre_dpto`) VALUES
('12345674', 'Usuario dos', 'RRHH'),
('12345678', 'Usuario', 'Sistemas'),
('12345679', 'Usuario tres', 'Gerencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizacion`
--

CREATE TABLE `organizacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `organizacion`
--

INSERT INTO `organizacion` (`id`, `nombre`) VALUES
(1, 'Organización Ejemplo A'),
(2, 'Organización Ejemplo B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sueldos`
--

CREATE TABLE `sueldos` (
  `id_sueldo` int(11) NOT NULL,
  `nombre_dpto` varchar(30) NOT NULL,
  `valor_hora` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sueldo_empleado`
--

CREATE TABLE `sueldo_empleado` (
  `id` int(11) NOT NULL,
  `id_departamento` varchar(30) NOT NULL,
  `id_empleado` varchar(30) NOT NULL,
  `valor_hora` decimal(10,2) NOT NULL,
  `horas_laboradas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `cedula`, `nombre`, `apellido`, `email`, `pwd`) VALUES
(1, 'V12345678', 'Alejandro', 'Marquina', 'alejandro@gmail.com', 'Prueba456.'),
(5, 'V1452111', 'USUARIO', 'USUARIO', '', ''),
(25, 'V1478541', 'RAUL', 'PARRA', '', ''),
(8, 'V1547844', 'ALEJANDRO DOS', 'ALEJANDRO DOS', '', ''),
(26, 'V20145211', 'RAUL', 'DOS', '', ''),
(24, 'V2145114', 'PRUEBA UNO', 'PRUEBA', '', ''),
(21, 'V30895650', 'ALEJANDRO ', 'JOSE', '', ''),
(4, 'V8888811', 'Usuario', 'Ejemplo 2', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`nombre`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `nombre_organizacion` (`nombre_organizacion`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `nombre_dpto` (`nombre_dpto`);

--
-- Indices de la tabla `organizacion`
--
ALTER TABLE `organizacion`
  ADD PRIMARY KEY (`nombre`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `sueldos`
--
ALTER TABLE `sueldos`
  ADD PRIMARY KEY (`valor_hora`),
  ADD UNIQUE KEY `id_sueldo` (`id_sueldo`),
  ADD KEY `nombre_dpto` (`nombre_dpto`);

--
-- Indices de la tabla `sueldo_empleado`
--
ALTER TABLE `sueldo_empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `organizacion`
--
ALTER TABLE `organizacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sueldos`
--
ALTER TABLE `sueldos`
  MODIFY `id_sueldo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sueldo_empleado`
--
ALTER TABLE `sueldo_empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`nombre_organizacion`) REFERENCES `organizacion` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`nombre_dpto`) REFERENCES `departamentos` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
