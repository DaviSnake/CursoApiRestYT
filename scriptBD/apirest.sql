-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-01-2025 a las 19:52:42
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
-- Base de datos: `apirest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `CitaId` int(11) NOT NULL,
  `PacienteId` varchar(45) DEFAULT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  `HoraInicio` varchar(45) DEFAULT NULL,
  `HoraFIn` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Motivo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`CitaId`, `PacienteId`, `Fecha`, `HoraInicio`, `HoraFIn`, `Estado`, `Motivo`) VALUES
(1, '1', '2020-06-09', '08:30:00', '09:00:00', 'Confirmada', 'El paciente presenta un leve dolor de espalda'),
(2, '2', '2020-06-10', '08:30:00', '09:00:00', 'Confirmada', 'Dolor en la zona lumbar '),
(3, '3', '2020-06-18', '09:00:00', '09:30:00', 'Confirmada', 'Dolor en el cuello');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `PacienteId` int(11) NOT NULL,
  `DNI` varchar(45) DEFAULT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `CodigoPostal` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`PacienteId`, `DNI`, `Nombre`, `Direccion`, `CodigoPostal`, `Telefono`, `Genero`, `FechaNacimiento`, `Correo`) VALUES
(3, 'C000000003', 'Marcela Dubon', 'Calle de pruebas 3', '20003', '633281511', 'F', '2000-07-22', 'Paciente3@gmail.com'),
(4, 'D000000004', 'Maria Mendez', 'Calle de pruebas 4', '20004', '633281516', 'F', '1980-01-01', 'Paciente4@gmail.com'),
(5, 'E000000005', 'Zamuel Valladares', 'Calle de pruebas 5', '20006', '633281519', 'M', '1985-12-15', 'Paciente5@gmail.com'),
(6, 'F000000006', 'Angel Rios', 'Calle de pruebas 6', '20005', '633281510', 'M', '1988-11-30', 'Paciente6@gmail.com'),
(8, 'ddsdsads', 'David Medina ', 'German Sandoval Miranda 84', '9000001', '944892697', 'M', '1976-03-08', 'dmedinac@gmail.com'),
(9, 'H000000008', 'David Medina C.', 'German Sandoval Miranda 84', '9000001', '944892697', 'M', '1976-03-03', 'dmedinac@gmail.com'),
(12, '3233', 'Cristina Maulen Rivera', 'asasa', '445454', '656565', 'Femenino', '1980-08-01', 'sdsdsd'),
(13, '23243', 'dsds', 'dssds', '43434', '53434', 'M', '1976-03-03', 'fdfd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `UsuarioId` int(11) NOT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`UsuarioId`, `Usuario`, `Password`, `Estado`) VALUES
(1, 'usuario1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(2, 'usuario2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(3, 'usuario3@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(4, 'usuario4@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(5, 'usuario5@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(6, 'usuario6@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
(7, 'usuario7@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Inactivo'),
(8, 'usuario8@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Inactivo'),
(9, 'usuario9@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_token`
--

CREATE TABLE `usuarios_token` (
  `TokenId` int(11) NOT NULL,
  `UsuarioId` varchar(45) DEFAULT NULL,
  `Token` varchar(255) DEFAULT NULL,
  `Estado` varchar(45) CHARACTER SET armscii8 COLLATE armscii8_general_ci DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios_token`
--

INSERT INTO `usuarios_token` (`TokenId`, `UsuarioId`, `Token`, `Estado`, `Fecha`) VALUES
(1, '1', 'e304d18abb642af099e6860fae0e6f3d', 'Inactivo', '2024-12-19 20:32:00'),
(2, '1', 'cecb75f097972c50e6152a199929e2b8', 'Inactivo', '2024-12-19 20:34:00'),
(3, '1', 'eb9df0d9d1b6e324ee9a42a0fcfe1e12', 'Inactivo', '2024-12-19 20:37:00'),
(4, '1', '975534047b4181c26e29219d42fbfb04', 'Inactivo', '2024-12-22 00:57:00'),
(5, '1', '047685d42bc2b0729427d8b5a8d95b57', 'Inactivo', '2024-12-22 01:15:00'),
(6, '1', '34583b8b7844ca98a7a859b2aed70614', 'Inactivo', '2024-12-22 01:15:00'),
(7, '1', '5971bd020888ed341223b65dc32599d3', 'Inactivo', '2024-12-22 01:15:00'),
(8, '1', '5fc7534a08d7b512281e3f9a68c4a5f8', 'Inactivo', '2024-12-22 01:32:00'),
(9, '1', '23c36e9fe9c4374a4b5c2d5380474e9b', 'Inactivo', '2024-12-22 07:09:00'),
(10, '1', '09e2f8ab22eb5ebb6796475218c8f8f5', 'Inactivo', '2025-01-08 02:46:00'),
(11, '1', '19e5a153603f99dc16451d8cc418189c', 'Inactivo', '2025-01-08 03:31:00'),
(12, '1', '10df344b92ebe5d3152ef86e9c4348fb', 'Inactivo', '2025-01-08 04:04:00'),
(13, '1', 'c67533183485d46941c14e947dbf3b02', 'Inactivo', '2025-01-08 04:06:00'),
(14, '1', 'f4291bd906a5a4e817b156c816e2e080', 'Inactivo', '2025-01-08 04:30:00'),
(15, '1', '3d4f48ad4da809fdc1b8f8fcbd23f75f', 'Inactivo', '2025-01-08 04:31:00'),
(16, '1', 'e8368e390b757b76088a70c5c1be0686', 'Inactivo', '2025-01-08 04:46:00'),
(17, '1', '2ba8d17a1b78183ee31268c99607feca', 'Inactivo', '2025-01-08 04:57:00'),
(18, '1', '6b6703095899f81249d4bedef3f18dca', 'Inactivo', '2025-01-08 18:07:00'),
(19, '1', 'eea383ca4bdac3d6fd2744f05d8bf566', 'Inactivo', '2025-01-08 18:47:00'),
(20, '1', 'f202e24b1b6e2045005f3f213bbd56a9', 'Inactivo', '2025-01-08 18:48:00'),
(21, '1', '9c0045191711129f37c83e0c63550114', 'Inactivo', '2025-01-08 20:32:00'),
(22, '1', 'fb127caafc8434b0f4f2108370197149', 'Inactivo', '2025-01-08 20:39:00'),
(23, '1', '098a2c89420201ccc09da61adcda4433', 'Inactivo', '2025-01-08 22:18:00'),
(24, '1', '08833705cdaefe73f4555e11f4cf3a1a', 'Inactivo', '2025-01-11 02:53:00'),
(25, '1', 'a7054a901d9c6a5f086975e7069abbc7', 'Inactivo', '2025-01-11 03:55:00'),
(26, '1', '8e96b14d02a4c411e00772904c9692c5', 'Inactivo', '2025-01-11 04:00:00'),
(27, '1', 'ad133428664be41236e7a78bebb81cf5', 'Inactivo', '2025-01-11 04:00:00'),
(28, '1', 'bcf937862c1262e493d4ea357a0e3f2e', 'Inactivo', '2025-01-11 04:08:00'),
(29, '1', '4eb126d7c3149c4ce20e47c1ed3290a0', 'Inactivo', '2025-01-11 05:30:00'),
(30, '1', 'ff2157e1a4f803e539fb704e872a13ad', 'Inactivo', '2025-01-11 05:55:00'),
(31, '1', '96b0dae8e6900ea997904794c10ac3e1', 'Inactivo', '2025-01-11 06:06:00'),
(32, '1', 'ac76c86620678f9c4dbbd0e13f28e713', 'Inactivo', '2025-01-11 06:11:00'),
(33, '1', '8d492e532f7519100301ff534d5ac706', 'Inactivo', '2025-01-11 06:51:00'),
(34, '1', '4fb83ec96883083146462dde54fd7fcc', 'Inactivo', '2025-01-11 07:09:00'),
(35, '1', '53328af6edd22172d9a5a4fa417dc352', 'Inactivo', '2025-01-11 07:14:00'),
(36, '1', '82f9382934019bc5d246c4a3a667e441', 'Inactivo', '2025-01-11 07:15:00'),
(37, '1', '07aca858b6a612e2e1e32ab973eab224', 'Inactivo', '2025-01-11 07:15:00'),
(38, '1', 'ba08d7a80df71957ad3e3db9c03ad390', 'Inactivo', '2025-01-12 03:18:00'),
(39, '1', 'ac34bf2712e19c827250a740dc3747d7', 'Inactivo', '2025-01-12 03:18:00'),
(40, '1', '005492fe19c504b2118ba4706683bf8d', 'Inactivo', '2025-01-12 03:21:00'),
(41, '1', '340e0d7cdc3baeb8a18751c0f202167d', 'Inactivo', '2025-01-12 03:24:00'),
(42, '1', '299f26ff15754e61443acd633e774b9d', 'Inactivo', '2025-01-12 05:07:00'),
(43, '1', '3efd8ca50e86058dbeaee51b6f54b9a9', 'Inactivo', '2025-01-12 07:39:00'),
(44, '1', 'c45dcc59deca570d829cd32cc4135404', 'Inactivo', '2025-01-12 07:41:00'),
(45, '1', '63455d85f09527970951ed64fc9a46cb', 'Inactivo', '2025-01-12 08:39:00'),
(46, '1', 'dd870f8717c5aeb54a7ab34a9c683fa2', 'Inactivo', '2025-01-12 08:48:00'),
(47, '1', 'eb3683c4e6deaac09a46d7da345124e5', 'Inactivo', '2025-01-12 08:51:00'),
(48, '1', 'f441a84c9b1fbfdd15954c30fe081546', 'Inactivo', '2025-01-12 08:56:00'),
(49, '1', 'f0f828d901051cb09b30e9537983a019', 'Inactivo', '2025-01-12 08:58:00'),
(50, '1', '7d0b43517b4528e4464f8059362f7fb6', 'Inactivo', '2025-01-12 09:09:00'),
(51, '1', '3e25a0da84a0ac342459c99705bf7741', 'Inactivo', '2025-01-12 09:11:00'),
(52, '1', '820c35296a656bcabdd669113238cd54', 'Inactivo', '2025-01-12 09:13:00'),
(53, '1', '902863524b5788825ec1ffc04807d759', 'Inactivo', '2025-01-12 09:21:00'),
(54, '1', '03e8df60b71ab31459f2284ed5e1d68d', 'Inactivo', '2025-01-12 09:22:00'),
(55, '1', 'c0b6a20e06de5ed80de6f6449aa10149', 'Inactivo', '2025-01-12 09:28:00'),
(56, '2', 'f1fe4a7b9c909989efa1d42e40f6cd99', 'Inactivo', '2025-01-12 09:29:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`CitaId`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`PacienteId`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UsuarioId`);

--
-- Indices de la tabla `usuarios_token`
--
ALTER TABLE `usuarios_token`
  ADD PRIMARY KEY (`TokenId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `CitaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `PacienteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `UsuarioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios_token`
--
ALTER TABLE `usuarios_token`
  MODIFY `TokenId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
