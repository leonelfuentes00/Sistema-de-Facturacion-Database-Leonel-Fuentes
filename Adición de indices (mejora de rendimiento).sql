USE facturacion;

-- INDICES

-- TABLA CLIENTE
	-- búsquedas por nombre de cliente.
	CREATE INDEX idx_cliente_nombre ON cliente (nombre);
	-- búsquedas por número de identificación
	CREATE INDEX idx_cliente_DNI ON cliente (DNI);
	-- 
-- TABLA EMPLEADO
	-- búsquedas por nombre de empleado.
	CREATE INDEX idx_empleado_nombre ON empleado (nombre);
    -- búsquedas por número de identificación
	CREATE INDEX idx_empleado_DNI ON empleado (DNI);
-- TABLA PRODUCTO
	-- búsquedas frecuentes por nombre de producto
    CREATE INDEX idx_producto_nombre ON producto (nombre);
-- TABLA FACTURA
	-- búsqueda de facturas por cliente
    CREATE INDEX idx_factura_cliente ON factura (id_cliente);
-- TABLA DETALLE FACTURA PRODUCTO
	-- mejorar el rendimiento de las consultas relacionadas con facturas y productos
    CREATE INDEX idx_detalle_factura_id_factura ON detalle_factura_producto (id_factura);
	CREATE INDEX idx_detalle_factura_id_producto ON detalle_factura_producto (id_producto);

