-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2025 a las 06:20:40
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
-- Base de datos: `parrilla51`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_historial_pedido` (IN `p_id_pedido` INT, IN `p_estado` VARCHAR(50))   BEGIN
    INSERT INTO historial_pedidos (id_pedido, estado, fecha_cambio)
    VALUES (p_id_pedido, p_estado, NOW());
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertas`
--

CREATE TABLE `alertas` (
  `id_alerta` int(11) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  `tipo` enum('stock','pedido','reserva','usuario','producto') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alertas`
--

INSERT INTO `alertas` (`id_alerta`, `mensaje`, `fecha`, `tipo`) VALUES
(1, '👤 Nuevo usuario registrado: Andrés Arias', '2025-09-03 19:07:43', 'usuario'),
(2, '👤 Nuevo usuario registrado: Carlos Ramírez', '2025-09-03 19:07:43', 'usuario'),
(3, '👤 Nuevo usuario registrado: ANDRES ARIAS', '2025-09-03 19:17:39', 'usuario'),
(4, '👤 Nuevo usuario registrado: ANDRES ARIAS', '2025-09-03 19:32:13', 'usuario'),
(5, '📅 Se creó una reserva para el 2025-09-14 a las 18:00:00 en la mesa 1', '2025-09-14 17:36:49', 'reserva'),
(6, '👤 Nuevo usuario registrado: ANDRES ARIAS', '2025-09-14 18:50:59', 'usuario'),
(7, '👤 Nuevo usuario registrado: ANDRES ARIAS', '2025-09-14 18:52:55', 'usuario'),
(8, '👤 Nuevo usuario registrado: ANDRES ARIAS', '2025-09-14 18:56:01', 'usuario'),
(9, '👤 Nuevo usuario registrado: ANDRES ARIAS', '2025-09-14 19:00:49', 'usuario'),
(10, '👤 Nuevo usuario registrado: Carlos Ramírez', '2025-09-14 19:02:31', 'usuario'),
(11, '👤 Nuevo usuario registrado: Carlos Ramírez', '2025-09-15 18:02:09', 'usuario'),
(12, '📅 Se creó una reserva para el 2025-09-18 a las 06:59:00 en la mesa 1', '2025-09-15 18:56:23', 'reserva'),
(13, '👤 Nuevo usuario registrado: ANDRES ARIAS', '2025-09-15 20:12:03', 'usuario'),
(14, '📅 Se creó una reserva para el 2025-09-18 a las 12:35:00 en la mesa 2', '2025-09-15 21:32:39', 'reserva'),
(16, '❌ El pedido N° 1 fue cancelado', '2025-09-15 22:27:32', 'pedido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Carnes'),
(2, 'Bebidas'),
(3, 'Entradas'),
(4, 'Postres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `cod_pedido` int(11) DEFAULT NULL,
  `cod_producto` int(11) DEFAULT NULL,
  `cantidad` bigint(20) DEFAULT NULL,
  `precio_unitario` bigint(20) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `cod_pedido`, `cod_producto`, `cantidad`, `precio_unitario`, `iva`) VALUES
(1, 1, 2, 1, 1000, NULL),
(2, 2, 2, 1, 1000, NULL),
(3, 3, 2, 1, 1000, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilios`
--

CREATE TABLE `domicilios` (
  `id_domicilio` int(11) NOT NULL,
  `cod_pedido` int(11) DEFAULT NULL,
  `cod_usuario` int(11) DEFAULT NULL,
  `cod_direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_pedidos`
--

CREATE TABLE `historial_pedidos` (
  `id_historial` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `estado` enum('pendiente','en preparacion','entregado','cancelado') NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fecha_cambio` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_pedidos`
--

INSERT INTO `historial_pedidos` (`id_historial`, `id_pedido`, `estado`, `fecha`, `hora`, `fecha_cambio`) VALUES
(2, 1, 'entregado', '0000-00-00', '00:00:00', '2025-09-15 22:27:30'),
(3, 1, 'cancelado', '0000-00-00', '00:00:00', '2025-09-15 22:27:32'),
(4, 1, 'entregado', '0000-00-00', '00:00:00', '2025-09-15 22:27:34'),
(5, 1, 'pendiente', '0000-00-00', '00:00:00', '2025-09-15 22:27:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id_insumo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fecha_vencimiento` date DEFAULT NULL,
  `lote` varchar(50) DEFAULT NULL,
  `subcategoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id_mesa` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `estado` enum('Disponible','No disponible') DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id_mesa`, `numero`, `capacidad`, `estado`) VALUES
(1, 0, 4, 'Disponible'),
(2, 21, 12, 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `tipo_entrega` enum('restaurante','domicilio') DEFAULT NULL,
  `cod_mesa` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `estado` enum('entregado','cancelado','pendiente','en preparacion') DEFAULT 'pendiente',
  `cod_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `tipo_entrega`, `cod_mesa`, `fecha`, `hora`, `metodo_pago`, `telefono`, `total`, `estado`, `cod_usuario`) VALUES
(1, 'restaurante', 1, '2025-09-15', '22:17:23', NULL, NULL, 1000, 'pendiente', 16),
(2, 'domicilio', NULL, '2025-09-15', '22:53:18', NULL, NULL, 1000, 'pendiente', 16),
(3, 'domicilio', NULL, '2025-09-15', '22:56:40', 'tarjeta', NULL, 1000, 'pendiente', 16);

--
-- Disparadores `pedidos`
--
DELIMITER $$
CREATE TRIGGER `trg_alerta_pedido_cancelado` AFTER UPDATE ON `pedidos` FOR EACH ROW BEGIN
    IF NEW.estado = 'cancelado' AND OLD.estado <> 'cancelado' THEN
        INSERT INTO alertas(mensaje, fecha, tipo)
        VALUES (CONCAT('❌ El pedido N° ', NEW.id_pedido, ' fue cancelado'), NOW(), 'pedido');
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_alerta_pedido_confirmado` AFTER UPDATE ON `pedidos` FOR EACH ROW BEGIN
    IF NEW.estado = 'confirmado' AND OLD.estado <> 'confirmado' THEN
        INSERT INTO alertas(mensaje, fecha, tipo)
        VALUES (CONCAT('✅ El pedido N° ', NEW.id_pedido, ' fue confirmado'), NOW(), 'pedido');
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_pedidos_historial` AFTER UPDATE ON `pedidos` FOR EACH ROW BEGIN
    IF NEW.estado <> OLD.estado THEN
        CALL registrar_historial_pedido(NEW.id_pedido, NEW.estado);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_mesa`
--

CREATE TABLE `pedido_mesa` (
  `cod_pedido` int(11) NOT NULL,
  `cod_mesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `cantidad` bigint(20) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `precio` bigint(20) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `fecha_lote` date DEFAULT NULL,
  `cod_categoria` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `cantidad`, `descripcion`, `precio`, `fecha_vencimiento`, `fecha_lote`, `cod_categoria`, `imagen`) VALUES
(2, 'pan', 10, '10', 1000, NULL, NULL, 3, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEhUSERIQFhUVFRcQEBYVFhUPEBAQFhUWFhUXFhUYHSggGRolHRUWITEhJykrLi4uFx8zODUsNygtLisBCgoKDg0OGRAQGi0lHyUtLS0tKy0tKystLS0tLS4tLS0tLS0wLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLf/AABEIAMIBAwMBIgACEQEDEQH/');

--
-- Disparadores `productos`
--
DELIMITER $$
CREATE TRIGGER `trg_alerta_producto_eliminado` AFTER DELETE ON `productos` FOR EACH ROW BEGIN
    INSERT INTO alertas(mensaje, fecha, tipo)
    VALUES (CONCAT('❌ Se eliminó el producto "', OLD.nombre, '" del inventario'), NOW(), 'producto');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_alerta_stock_bajo` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
    IF NEW.cantidad < 5 AND OLD.cantidad >= 5 THEN
        INSERT INTO alertas(mensaje, fecha, tipo)
        VALUES (CONCAT('⚠ El producto "', NEW.nombre, '" tiene stock bajo: ', NEW.cantidad), NOW(), 'stock');
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_alerta_stock_recuperado` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
    IF NEW.cantidad >= 5 AND OLD.cantidad < 5 THEN
        INSERT INTO alertas(mensaje, fecha, tipo)
        VALUES (CONCAT('✅ El producto "', NEW.nombre, '" se recuperó, stock actual: ', NEW.cantidad), NOW(), 'stock');
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `cant_personas` int(11) NOT NULL,
  `estado` enum('disponible','no disponible') DEFAULT 'disponible',
  `cod_mesa` int(11) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `fecha`, `hora`, `cant_personas`, `estado`, `cod_mesa`, `telefono`, `id_usuario`) VALUES
(3, '2025-09-14', '18:00:00', 4, 'disponible', 1, NULL, NULL),
(4, '2025-09-18', '06:59:00', 1, '', 1, '321123', 16),
(5, '2025-09-18', '12:35:00', 10, '', 2, '321123', 16);

--
-- Disparadores `reservas`
--
DELIMITER $$
CREATE TRIGGER `trg_alerta_reserva_cancelada` AFTER DELETE ON `reservas` FOR EACH ROW BEGIN
    INSERT INTO alertas(mensaje, fecha, tipo)
    VALUES (
        CONCAT('❌ Se canceló la reserva N° ', OLD.id_reserva),
        NOW(),
        'reserva'
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_alerta_reserva_creada` AFTER INSERT ON `reservas` FOR EACH ROW BEGIN
    INSERT INTO alertas(mensaje, fecha, tipo)
    VALUES (CONCAT('? Se creó una reserva para el ', NEW.fecha, ' a las ', NEW.hora, 
                   ' en la mesa ', NEW.cod_mesa), NOW(), 'reserva');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `id_salida` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` bigint(20) DEFAULT NULL,
  `cod_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias_insumos`
--

CREATE TABLE `subcategorias_insumos` (
  `id_subcategoria` int(11) NOT NULL,
  `nombre_subcategoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `rol` enum('cliente','empleado','administrador') DEFAULT 'cliente',
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `token_activacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `telefono`, `direccion`, `correo`, `contraseña`, `rol`, `estado`, `token_activacion`) VALUES
(16, 'Carlos', 'Ramírezzzz', 3213, 'Calle 50 #10-20', 'andresitoarias96yurtyrtyrt@gmail.com', 'scrypt:32768:8:1$RmJ5HGmgJS62pohh$22121b36889cd44c11480b7853a9c9547ce443aede61cd9858d342377ac717c91d4cf2b6b86e913e66cdde9751b31e04532df05f52c2762bc1e0b05d9d88006b', 'cliente', 'activo', NULL),
(18, 'ANDRES', 'ARIAS', 321123, 'Calle 50 #10-20', 'andresitoarias96@gmail.com', 'scrypt:32768:8:1$QHOI2LH8L9cVNMbV$f12db04d82c6251cb3946f636e2d7a86082a54f6c3702479c06f8bd94d6dd59ab431416736c5dfd225638bb90400dd7c557066c8609b6a41cdbb187feed68d4a', 'administrador', 'activo', NULL);

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `trg_alerta_usuario_desactivado` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
    IF NEW.estado = 'inactivo' AND OLD.estado <> 'inactivo' THEN
        INSERT INTO alertas(mensaje, fecha, tipo)
        VALUES (CONCAT('? El usuario "', OLD.nombre, ' ', OLD.apellido, '" fue desactivado'), NOW(), 'usuario');
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_alerta_usuario_registrado` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO alertas(mensaje, fecha, tipo)
    VALUES (CONCAT('? Nuevo usuario registrado: ', NEW.nombre, ' ', NEW.apellido), NOW(), 'usuario');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_alertas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_alertas` (
`id_alerta` int(11)
,`mensaje` varchar(255)
,`fecha` datetime
,`tipo` enum('stock','pedido','reserva','usuario','producto')
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_detalle_pedidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_detalle_pedidos` (
`id_detalle` int(11)
,`id_pedido` int(11)
,`fecha` date
,`hora` time
,`producto` varchar(60)
,`cantidad` bigint(20)
,`precio_unitario` bigint(20)
,`subtotal` bigint(39)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_historial_pedidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_historial_pedidos` (
`id_historial` int(11)
,`id_pedido` int(11)
,`fecha` date
,`hora` time
,`nombre_usuario` varchar(100)
,`apellido_usuario` varchar(100)
,`estado` enum('pendiente','en preparacion','entregado','cancelado')
,`fecha_estado` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_historial_usuarios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_historial_usuarios` (
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pedidos_usuarios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pedidos_usuarios` (
`id_pedido` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`fecha` date
,`hora` time
,`total` bigint(20)
,`estado` enum('entregado','cancelado','pendiente','en preparacion')
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_categorias`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_categorias` (
`id_producto` int(11)
,`nombre` varchar(60)
,`precio` bigint(20)
,`cantidad` bigint(20)
,`nombre_categoria` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_reservas_mesas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_reservas_mesas` (
`id_reserva` int(11)
,`fecha` date
,`hora` time
,`cant_personas` int(11)
,`estado` enum('disponible','no disponible')
,`id_mesa` int(11)
,`capacidad` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_stock_bajo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_stock_bajo` (
`id_producto` int(11)
,`nombre` varchar(60)
,`cantidad` bigint(20)
,`precio` bigint(20)
,`estado_stock` varchar(16)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_alertas`
--
DROP TABLE IF EXISTS `vista_alertas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_alertas`  AS SELECT `alertas`.`id_alerta` AS `id_alerta`, `alertas`.`mensaje` AS `mensaje`, `alertas`.`fecha` AS `fecha`, `alertas`.`tipo` AS `tipo` FROM `alertas` ORDER BY `alertas`.`fecha` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_detalle_pedidos`
--
DROP TABLE IF EXISTS `vista_detalle_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_detalle_pedidos`  AS SELECT `dp`.`id_detalle` AS `id_detalle`, `dp`.`cod_pedido` AS `id_pedido`, `p`.`fecha` AS `fecha`, `p`.`hora` AS `hora`, `pr`.`nombre` AS `producto`, `dp`.`cantidad` AS `cantidad`, `dp`.`precio_unitario` AS `precio_unitario`, `dp`.`cantidad`* `dp`.`precio_unitario` AS `subtotal` FROM ((`detalle_pedido` `dp` join `pedidos` `p` on(`dp`.`cod_pedido` = `p`.`id_pedido`)) join `productos` `pr` on(`dp`.`cod_producto` = `pr`.`id_producto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_historial_pedidos`
--
DROP TABLE IF EXISTS `vista_historial_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_historial_pedidos`  AS SELECT `h`.`id_historial` AS `id_historial`, `h`.`id_pedido` AS `id_pedido`, `p`.`fecha` AS `fecha`, `p`.`hora` AS `hora`, `u`.`nombre` AS `nombre_usuario`, `u`.`apellido` AS `apellido_usuario`, `h`.`estado` AS `estado`, `h`.`fecha` AS `fecha_estado` FROM ((`historial_pedidos` `h` join `pedidos` `p` on(`h`.`id_pedido` = `p`.`id_pedido`)) join `usuarios` `u` on(`p`.`cod_usuario` = `u`.`id_usuario`)) WHERE `h`.`estado` in ('entregado','cancelado') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_historial_usuarios`
--
DROP TABLE IF EXISTS `vista_historial_usuarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_historial_usuarios`  AS SELECT `u`.`id_usuario` AS `id_usuario`, concat(`u`.`nombre`,' ',`u`.`apellido`) AS `nombre_completo`, `p`.`id_pedido` AS `id_pedido`, `p`.`tipo_entrega` AS `tipo_entrega`, `h`.`estado` AS `estado`, `h`.`fecha` AS `fecha`, `h`.`hora` AS `hora`, `p`.`total` AS `total` FROM ((`historial_pedidos` `h` join `usuarios` `u` on(`h`.`cod_usuario` = `u`.`id_usuario`)) join `pedidos` `p` on(`h`.`id_pedido` = `p`.`id_pedido`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pedidos_usuarios`
--
DROP TABLE IF EXISTS `vista_pedidos_usuarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pedidos_usuarios`  AS SELECT `p`.`id_pedido` AS `id_pedido`, `u`.`nombre` AS `nombre`, `u`.`apellido` AS `apellido`, `p`.`fecha` AS `fecha`, `p`.`hora` AS `hora`, `p`.`total` AS `total`, `p`.`estado` AS `estado` FROM (`pedidos` `p` join `usuarios` `u` on(`p`.`cod_usuario` = `u`.`id_usuario`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_categorias`
--
DROP TABLE IF EXISTS `vista_productos_categorias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos_categorias`  AS SELECT `p`.`id_producto` AS `id_producto`, `p`.`nombre` AS `nombre`, `p`.`precio` AS `precio`, `p`.`cantidad` AS `cantidad`, `c`.`nombre_categoria` AS `nombre_categoria` FROM (`productos` `p` join `categorias` `c` on(`p`.`cod_categoria` = `c`.`id_categoria`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_reservas_mesas`
--
DROP TABLE IF EXISTS `vista_reservas_mesas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_reservas_mesas`  AS SELECT `r`.`id_reserva` AS `id_reserva`, `r`.`fecha` AS `fecha`, `r`.`hora` AS `hora`, `r`.`cant_personas` AS `cant_personas`, `r`.`estado` AS `estado`, `m`.`id_mesa` AS `id_mesa`, `m`.`capacidad` AS `capacidad` FROM (`reservas` `r` join `mesas` `m` on(`r`.`cod_mesa` = `m`.`id_mesa`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_stock_bajo`
--
DROP TABLE IF EXISTS `vista_stock_bajo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_stock_bajo`  AS SELECT `productos`.`id_producto` AS `id_producto`, `productos`.`nombre` AS `nombre`, `productos`.`cantidad` AS `cantidad`, `productos`.`precio` AS `precio`, CASE WHEN `productos`.`cantidad` = 0 THEN 'Sin stock' WHEN `productos`.`cantidad` < 5 THEN 'Stock bajo' ELSE 'Stock suficiente' END AS `estado_stock` FROM `productos` WHERE `productos`.`cantidad` < 5 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alertas`
--
ALTER TABLE `alertas`
  ADD PRIMARY KEY (`id_alerta`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `cod_pedido` (`cod_pedido`),
  ADD KEY `cod_producto` (`cod_producto`);

--
-- Indices de la tabla `domicilios`
--
ALTER TABLE `domicilios`
  ADD PRIMARY KEY (`id_domicilio`),
  ADD UNIQUE KEY `cod_pedido` (`cod_pedido`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indices de la tabla `historial_pedidos`
--
ALTER TABLE `historial_pedidos`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id_insumo`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id_mesa`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indices de la tabla `pedido_mesa`
--
ALTER TABLE `pedido_mesa`
  ADD PRIMARY KEY (`cod_pedido`,`cod_mesa`),
  ADD KEY `cod_mesa` (`cod_mesa`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `cod_categoria` (`cod_categoria`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `cod_mesa` (`cod_mesa`),
  ADD KEY `fk_reserva_usuario` (`id_usuario`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `cod_producto` (`cod_producto`);

--
-- Indices de la tabla `subcategorias_insumos`
--
ALTER TABLE `subcategorias_insumos`
  ADD PRIMARY KEY (`id_subcategoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alertas`
--
ALTER TABLE `alertas`
  MODIFY `id_alerta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `domicilios`
--
ALTER TABLE `domicilios`
  MODIFY `id_domicilio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_pedidos`
--
ALTER TABLE `historial_pedidos`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id_insumo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id_mesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `id_salida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcategorias_insumos`
--
ALTER TABLE `subcategorias_insumos`
  MODIFY `id_subcategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`cod_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`cod_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `domicilios`
--
ALTER TABLE `domicilios`
  ADD CONSTRAINT `domicilios_ibfk_1` FOREIGN KEY (`cod_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `domicilios_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `historial_pedidos`
--
ALTER TABLE `historial_pedidos`
  ADD CONSTRAINT `historial_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `pedido_mesa`
--
ALTER TABLE `pedido_mesa`
  ADD CONSTRAINT `pedido_mesa_ibfk_1` FOREIGN KEY (`cod_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `pedido_mesa_ibfk_2` FOREIGN KEY (`cod_mesa`) REFERENCES `mesas` (`id_mesa`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`cod_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_reserva_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`cod_mesa`) REFERENCES `mesas` (`id_mesa`);

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`cod_producto`) REFERENCES `productos` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
