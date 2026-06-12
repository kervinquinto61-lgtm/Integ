






// respetar el orden, esta son las ultimas 4 tablas

CREATE TABLE IF NOT EXISTS ventas (
  id_venta INT(11) NOT NULL AUTO_INCREMENT,
  fecha DATETIME DEFAULT current_timestamp(),
  id_cliente INT(11) DEFAULT NULL,
  id_usuario INT(11) DEFAULT NULL,
  total DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (id_venta),
  CONSTRAINT ventas_ibfk_1 FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
  CONSTRAINT ventas_ibfk_2 FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS detalle_venta (
  id_detalle INT(11) NOT NULL AUTO_INCREMENT,
  id_venta INT(11) NOT NULL,
  id_producto INT(11) NOT NULL,
  cantidad INT(11) DEFAULT NULL,
  precio_unitario DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (id_detalle),
  CONSTRAINT detalle_venta_ibfk_1 FOREIGN KEY (id_venta) REFERENCES ventas (id_venta),
  CONSTRAINT detalle_venta_ibfk_2 FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS garantias (
  id_garantia INT(11) NOT NULL AUTO_INCREMENT,
  id_cliente INT(11) DEFAULT NULL,
  id_producto INT(11) DEFAULT NULL,
  fecha_inicio DATE DEFAULT NULL,
  fecha_fin DATE DEFAULT NULL,
  descripcion TEXT DEFAULT NULL,
  estado VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id_garantia),
  CONSTRAINT garantias_ibfk_1 FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
  CONSTRAINT garantias_ibfk_2 FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS reportes (
  id_reporte INT(11) NOT NULL AUTO_INCREMENT,
  fecha_generado DATETIME DEFAULT CURRENT_TIMESTAMP,
  id_usuario INT(11) NOT NULL,
  id_cliente INT(11) DEFAULT NULL,
  rango_inicio DATE DEFAULT NULL,
  rango_fin DATE DEFAULT NULL,
  total_ventas DECIMAL(10,2) DEFAULT NULL,
  total_productos INT(11) DEFAULT NULL,
  observaciones TEXT DEFAULT NULL,
  PRIMARY KEY (id_reporte),
  CONSTRAINT reportes_ibfk_1 FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
  CONSTRAINT reportes_ibfk_2 FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
