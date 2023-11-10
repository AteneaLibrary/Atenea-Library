-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2023 a las 20:39:34
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
-- Base de datos: `atenea_library`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `ID` int(10) NOT NULL,
  `Tipo_Documento` varchar(2) DEFAULT NULL,
  `Nombre_1` varchar(25) DEFAULT NULL,
  `Nombre_2` varchar(25) DEFAULT NULL,
  `Apellido_1` varchar(25) DEFAULT NULL,
  `Apellido_2` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`ID`, `Tipo_Documento`, `Nombre_1`, `Nombre_2`, `Apellido_1`, `Apellido_2`) VALUES
(12345678, 'CC', 'Carlos', NULL, 'Florez', 'Muñoz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `ID_Genero` int(11) NOT NULL,
  `Genero` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infopersonal`
--

CREATE TABLE `infopersonal` (
  `ID` int(11) NOT NULL,
  `ID_Documento` int(10) DEFAULT NULL,
  `Telefono` varchar(11) DEFAULT NULL,
  `Correo_Electrónico` varchar(50) DEFAULT NULL,
  `ID_Referencia_Personal` int(10) DEFAULT NULL,
  `ID_Referencia_Familiar` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `infopersonal`
--

INSERT INTO `infopersonal` (`ID`, `ID_Documento`, `Telefono`, `Correo_Electrónico`, `ID_Referencia_Personal`, `ID_Referencia_Familiar`) VALUES
(1, 12345678, '3214568790', 'Carlos_23@gmail.com', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `Codigo` varchar(10) NOT NULL,
  `Titulo` varchar(50) DEFAULT NULL,
  `Año_Lanzamiento` int(4) DEFAULT NULL,
  `Autor` varchar(50) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  `Editorial` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_genero`
--

CREATE TABLE `libro_genero` (
  `ID` int(11) NOT NULL,
  `ID_Libro` varchar(10) DEFAULT NULL,
  `ID_Genero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `préstamo`
--

CREATE TABLE `préstamo` (
  `ID_Préstamo` int(10) NOT NULL,
  `ID_Usuario` int(10) DEFAULT NULL,
  `Codigo_Libro` varchar(10) DEFAULT NULL,
  `Fecha_Préstamo` date DEFAULT NULL,
  `Fecha_Devolución` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencia_familiar`
--

CREATE TABLE `referencia_familiar` (
  `ID` int(11) NOT NULL,
  `Nombre_1` varchar(25) DEFAULT NULL,
  `Nombre_2` varchar(25) DEFAULT NULL,
  `Apellido_1` varchar(25) DEFAULT NULL,
  `Apellido_2` varchar(25) DEFAULT NULL,
  `Numero_Telefono` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `referencia_familiar`
--

INSERT INTO `referencia_familiar` (`ID`, `Nombre_1`, `Nombre_2`, `Apellido_1`, `Apellido_2`, `Numero_Telefono`) VALUES
(1, 'Andres', 'Felipe', 'Castilla', 'Muñoz', '3012453445');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencia_personal`
--

CREATE TABLE `referencia_personal` (
  `ID` int(11) NOT NULL,
  `Nombre_1` varchar(25) DEFAULT NULL,
  `Nombre_2` varchar(25) DEFAULT NULL,
  `Apellido_1` varchar(25) DEFAULT NULL,
  `Apellido_2` varchar(25) DEFAULT NULL,
  `Numero_Telefono` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `referencia_personal`
--

INSERT INTO `referencia_personal` (`ID`, `Nombre_1`, `Nombre_2`, `Apellido_1`, `Apellido_2`, `Numero_Telefono`) VALUES
(1, 'Carlos', 'Felipe', 'Campo', 'Rios', '3215423351'),
(3, 'Ejemplo', 'X', 'ApellidoEj', 'X', '12312312');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `ID_Registro` int(11) NOT NULL,
  `ID_Usuario` int(10) DEFAULT NULL,
  `Fecha_Inicial` date DEFAULT NULL,
  `Fecha_Limite` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(10) NOT NULL,
  `Nombre_Usuario` varchar(25) DEFAULT NULL,
  `ID_Documento` int(10) DEFAULT NULL,
  `ID_InfoPersonal` int(10) DEFAULT NULL,
  `Estado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID`, `Nombre_Usuario`, `ID_Documento`, `ID_InfoPersonal`, `Estado`) VALUES
(12345678, 'Carlos_2023', 12345678, 1, 'Ausente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`ID_Genero`);

--
-- Indices de la tabla `infopersonal`
--
ALTER TABLE `infopersonal`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Documento` (`ID_Documento`),
  ADD KEY `ID_Referencia_Personal` (`ID_Referencia_Personal`),
  ADD KEY `ID_Referencia_Familiar` (`ID_Referencia_Familiar`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `libro_genero`
--
ALTER TABLE `libro_genero`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Libro` (`ID_Libro`),
  ADD KEY `ID_Genero` (`ID_Genero`);

--
-- Indices de la tabla `préstamo`
--
ALTER TABLE `préstamo`
  ADD PRIMARY KEY (`ID_Préstamo`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `Codigo_Libro` (`Codigo_Libro`);

--
-- Indices de la tabla `referencia_familiar`
--
ALTER TABLE `referencia_familiar`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `referencia_personal`
--
ALTER TABLE `referencia_personal`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`ID_Registro`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Documento` (`ID_Documento`),
  ADD KEY `ID_InfoPersonal` (`ID_InfoPersonal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `ID_Genero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `infopersonal`
--
ALTER TABLE `infopersonal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `libro_genero`
--
ALTER TABLE `libro_genero`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `referencia_familiar`
--
ALTER TABLE `referencia_familiar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `referencia_personal`
--
ALTER TABLE `referencia_personal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `ID_Registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12345679;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `infopersonal`
--
ALTER TABLE `infopersonal`
  ADD CONSTRAINT `InfoPersonal_ibfk_1` FOREIGN KEY (`ID_Documento`) REFERENCES `documento` (`ID`),
  ADD CONSTRAINT `InfoPersonal_ibfk_2` FOREIGN KEY (`ID_Referencia_Personal`) REFERENCES `referencia_personal` (`ID`),
  ADD CONSTRAINT `InfoPersonal_ibfk_3` FOREIGN KEY (`ID_Referencia_Familiar`) REFERENCES `referencia_familiar` (`ID`);

--
-- Filtros para la tabla `libro_genero`
--
ALTER TABLE `libro_genero`
  ADD CONSTRAINT `Libro_Genero_ibfk_1` FOREIGN KEY (`ID_Libro`) REFERENCES `libro` (`Codigo`),
  ADD CONSTRAINT `Libro_Genero_ibfk_2` FOREIGN KEY (`ID_Genero`) REFERENCES `genero` (`ID_Genero`);

--
-- Filtros para la tabla `préstamo`
--
ALTER TABLE `préstamo`
  ADD CONSTRAINT `Préstamo_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `Préstamo_ibfk_2` FOREIGN KEY (`Codigo_Libro`) REFERENCES `libro` (`Codigo`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `Registro_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`ID_Documento`) REFERENCES `documento` (`ID`),
  ADD CONSTRAINT `Usuario_ibfk_2` FOREIGN KEY (`ID_InfoPersonal`) REFERENCES `infopersonal` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
