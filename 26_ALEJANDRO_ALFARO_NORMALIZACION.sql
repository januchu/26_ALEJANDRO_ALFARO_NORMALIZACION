-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2021 a las 00:22:20
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_direcciones`
--

CREATE TABLE `tbl_direcciones` (
  `id_direcciones` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_direcciones`
--

INSERT INTO `tbl_direcciones` (`id_direcciones`, `direccion`) VALUES
(1, 'Bo. San Blás'),
(2, 'Col. San Martín'),
(3, 'Res. Golf Club'),
(4, 'Bo. Lourdes'),
(5, 'Col. Brisas del Valle');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_envios`
--

CREATE TABLE `tbl_envios` (
  `id_envios` int(11) NOT NULL,
  `descripcion_envio` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `id_direcciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_envios`
--

INSERT INTO `tbl_envios` (`id_envios`, `descripcion_envio`, `fecha`, `id_direcciones`) VALUES
(1, 'Pollo Frito con Puré de Papas, 10 piezas, Coca-Cola 3 Lts, 20 Tortillas', '2021-05-17', 3),
(2, 'Hamburguesa de Pescado, Hamburguesa de Pollo, Hamburguesa Normal, Extra Papas Fritas', '2021-05-20', 5),
(3, 'Pasta Alfredo, 4 porciones, Vino Le-Blanc 1978', '2021-03-15', 4),
(4, 'Pescado al Vapor con Verduras', '2021-05-04', 4),
(5, 'Filet Migñon + Carne Asada, papas al horno, pan con ajo, ensalada', '2021-05-21', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_facturas`
--

CREATE TABLE `tbl_facturas` (
  `id_facturas` int(11) NOT NULL,
  `descripcion_factura` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `id_direcciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_facturas`
--

INSERT INTO `tbl_facturas` (`id_facturas`, `descripcion_factura`, `fecha`, `id_direcciones`) VALUES
(1, 'Nombre Cliente: Miguel\r\nCompra: Comida + Envío\r\nGastos: 837\r\nEfectivo\r\nPago: 1000\r\nVuelto: 163\r\n', '2021-05-21', 3),
(2, 'Nombre Cliente: Juan Rafael\r\nCompra: Comida\r\nGastos: 350\r\nTarjeta\r\nPago: Exacto', '2021-05-18', 1),
(3, 'Nombre Cliente: María Dariela Bosques\r\nCompra: Comida + Envío\r\nGastos: 2079\r\nTarjeta\r\nPago: Exacto', '2021-05-02', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventario`
--

CREATE TABLE `tbl_inventario` (
  `id_inventario` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_inventario`
--

INSERT INTO `tbl_inventario` (`id_inventario`, `producto`, `precio`) VALUES
(1, 'Tomates', 4),
(2, 'Pan', 60),
(3, 'Carne de Res', 100),
(4, 'Papas', 40),
(5, 'Pescado', 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pedidos`
--

CREATE TABLE `tbl_pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `descripcion_pedido` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `id_direcciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_pedidos`
--

INSERT INTO `tbl_pedidos` (`id_pedido`, `id_inventario`, `descripcion_pedido`, `fecha`, `id_direcciones`) VALUES
(1, 3, '50 libras', '2021-05-17', 1),
(2, 2, '200 bolsas de pan de hamburguesa', '2021-05-02', 5),
(3, 4, '500 Kilos de papas, frescas', '2021-05-08', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  ADD PRIMARY KEY (`id_direcciones`);

--
-- Indices de la tabla `tbl_envios`
--
ALTER TABLE `tbl_envios`
  ADD PRIMARY KEY (`id_envios`),
  ADD KEY `fk_direccion_envios` (`id_direcciones`);

--
-- Indices de la tabla `tbl_facturas`
--
ALTER TABLE `tbl_facturas`
  ADD PRIMARY KEY (`id_facturas`),
  ADD KEY `fk_direccion_factura` (`id_direcciones`);

--
-- Indices de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD PRIMARY KEY (`id_inventario`);

--
-- Indices de la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_direccion_pedido` (`id_direcciones`),
  ADD KEY `fk_inventario_pedidos` (`id_inventario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  MODIFY `id_direcciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_envios`
--
ALTER TABLE `tbl_envios`
  MODIFY `id_envios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_facturas`
--
ALTER TABLE `tbl_facturas`
  MODIFY `id_facturas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_envios`
--
ALTER TABLE `tbl_envios`
  ADD CONSTRAINT `tbl_envios_ibfk_1` FOREIGN KEY (`id_direcciones`) REFERENCES `tbl_direcciones` (`id_direcciones`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_facturas`
--
ALTER TABLE `tbl_facturas`
  ADD CONSTRAINT `tbl_facturas_ibfk_1` FOREIGN KEY (`id_direcciones`) REFERENCES `tbl_direcciones` (`id_direcciones`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD CONSTRAINT `tbl_pedidos_ibfk_1` FOREIGN KEY (`id_direcciones`) REFERENCES `tbl_direcciones` (`id_direcciones`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pedidos_ibfk_2` FOREIGN KEY (`id_inventario`) REFERENCES `tbl_inventario` (`id_inventario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
