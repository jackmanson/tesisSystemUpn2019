-- TABLA USUARIO --> entidad - fuerte
CREATE TABLE `personas`( -- Registros que llenan por usuario
    `id_persona` INT(8) AUTO_INCREMENT,
    `nombres` VARCHAR(45) NOT NULL,
    `dni` VARCHAR
    `apellido_paterno` VARCHAR(45) NOT NULL,
    `apellido_materno` VARCHAR(45) NOT NULL,
    `email` VARCHAR(35) NOT NULL,
    `foto` VARCHAR(100),
    fk_id_departamento
    fk_id_ciudad
    fk_id_distrito
    fk_id_calle
    fk_id_nacionalidad
    `fecha_alta_persona` DATETIME, /* -- ver si se puede mejorar el tipo de campo -- */
    `fecha_baja_persona` DATETIME, /* -- ver si se puede mejorar el tipo de campo -- */
    `fk_id_estado_actividad_1`INT(8), -- estado persona --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
    CONSTRAINT pk_id_persona PRIMARY KEY (id_persona),
    CONSTRAINT fk_id_estado_actividad FOREIGN KEY (fk_id_estado_actividad_1)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


-- TABLA TIPO TELEFONO
CREATE TABLE `tipo_telefono`(
	`id_tipo_telefono` INT
	`nombre_tipo_telefono` VARCHAR -- fijo- movil - nextel - etc.
);


-- TABLA INTERMEDIA PERSONAS Y TIPO TELEFONO
CREATE TABLE `personas_tipoTelefono`(
	fk_id_persona
	fk_id_tipo_telefono
	`numero_telefono` VARCHAR
);


-- TABLA DEPARTAMENTO
CREATE TABLE `departamento`(
	`id_departamento` INT
	`nombre_departamento` VARCHAR
);


-- TABLA CIUDAD
CREATE TABLE `ciudad`(
	`id_ciudad` INT
	`nombre_ciudad` VARCHAR
	fk_id_departamento
);


-- TABLA DISTRITO
CREATE TABLE `distrito`(
	`id_distrito` INT
	`nombre_distrito` VARCHAR
	fk_id_ciudad
);


-- TABLA CALLE
CREATE TABLE `calle`(
	`id_calle` INT
	`numero_calle` VARCHAR
	fk_id_distrito
);


-- TABLA NACIONALIDAD
CREATE TABLE `nacionalidad`(
	`id_nacionalidad` INT
	`nombre_nacionalidad` VARCHAR
);


-- TABLA AREA DE TRABAJO
CREATE TABLE `area_trabajo`( --/* administracion,comercial,diseño,patronaje,corte,estampado,telas,control y empaque */
	`id_area_trabajo` INT
	`nombre_area_trabajo` VARCHAR  -- areas internas o servicios de terceros
);


CREATE TABLE `perfil_usuario`(
	`id_perfil_usuario` INT
	`nombre_perfil` VARCHAR /* administrador - editor - consultor - proveedor*/
);


CREATE TABLE `empresas_empleadoras`(
	`id_empleador` INT
	`razon_social` VARCHAR
	`ruc` VARCHAR
	`fecha_constitucion` DATETIME
	`tipo_contitucion` -- SA - EIRL etc
	`fecha_registro` DATETIME
	fk_id_departamento
  fk_id_ciudad
  fk_id_distrito
  fk_id_calle
  fk_id_nacionalidad
	fk_id_estado_actividad
);


-- TABLA INTERMEDIA EMPRESAS EMPLEADORAS Y TIPO TELEFONO
CREATE TABLE `empresasEmpleadoras_tipoTelefono`(
	fk_id_empleador
	fk_id_tipo_telefono
	`numero_telefono` VARCHAR
);


CREATE TABLE `trabajadores`(
	`id_trabajador` INT
	fk_id_area_trabajo
	fk_id_empleador
	fk_id_persona
);


-- TABLA USUARIO -->  entidad - debil
CREATE TABLE `usuarios`( -- Registros que llenan por usuario
    `id_usuario` INT(8) AUTO_INCREMENT,
    `nickname` VARCHAR(15),
    `pass` VARCHAR(100),
    `fecha_alta_usuario` DATETIME, /* -- ver si se puede mejorar el tipo de campo -- */
    `fecha_baja_usuario` DATETIME, /* -- ver si se puede mejorar el tipo de campo -- */
    fk_id_persona_1
    fk_id_perfil_usuario /* administrador - editor - consultor - proveedor*/
    fk_id_estado_actividad_2  -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
    CONSTRAINT
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA TIPO_PRENDA  --> entidad - fuerte
CREATE TABLE `tipo_prenda`( --- Registros que llenan por usuario
	`id_tipo_prenda` INT(8) AUTO_INCREMENT,
	`nombre_tipo_prenda` VARCHAR(45), -- polo, body , canesu, etc.
	`descripcion` VARCHAR(100),
	`fecha_registro_tipo_prenda` DATETIME
);


-- TABLA INTERMEDIA TIPO DE PRENDA Y TECNICA DE ESTAMPADO --> Revisar si tiene proposito esta tabla
CREATE TABLE `tipo_prenda_tecnicas_estampado`(
	fk_id_tipo_prenda_1 --
	fk_id_tecnica_estampado
);


-- TABLA ESTILOS
CREATE TABLE `estilos`( -- Registros que llenan por usuario
	`id_estilo` INT(8) AUTO_INCREMENT,
	`nombre_estilo` VARCHAR(45), -- indicio de la marca y su codigo
	`estilo_genero` VARCHAR(45), -- mujer, hombre, niño, niña, bebe,bebo
	`descripcion` VARCHAR(100),
	`cantidad_prendas` INT(10),
	fk_tipo_prenda_2 VARCHAR(45), -- leggings, polo, falda, short, bodys ,etc
	fk_id_tecnica_estampado -- puff - glitter - plano - dischard - suave - covertura etc
	fk_id_orden_produccion
	fk_id_hangtag_1
	fk_id_codigo_estilo_produccion
);


-- TABLA INTERMEDIA ESTILOS Y TALLAS
CREATE TABLE `estilos_tallas`(
	fk_id_estilo
	fk_id_talla
	`curva_talla` INT
);


-- TABLA TALLAS
CREATE TABLE `tallas`(
	`id_talla` INT
	`talla` VARCHAR -- 2,4,6,8,10,12,14,16,16X,6/9,9/12,12/18,18/24,24/36,S,M,L y otros
);


-- TABLA ORDEN DE PRODUCCION --> entidad
CREATE TABLE `ordenes_produccion`( -- Registros que llenan por usuario
	`id_orden_produccion` INT(8) AUTO_INCREMENT,
	`numero_orden` VARCHAR,
	`cantidad_total_prendas` INT,  -- revisar este camnpo si es posible la suma o es mejor en programacion
	`observaciones_orden_produccion` VARCHAR(100),
	`fecha_inicial_envio` DATETIME
	`fecha_embarque` DATETIME,
	`fecha_registro_orden_produccion` DATETIME, -- Indicio de la aprobacion de la orden
	fk_id_cliente_1
	fk_id_estado_actividad_3 -- estado de produccion / espera - confirmado - cancelado
	fk_id_orden_guia_corte_1
	fk_id_usuario_9
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA CLIENTES
CREATE TABLE `clientes`(
	`id_cliente` INT(8) AUTO_INCREMENT,
	`razon_social_cliente` VARCHAR(45),
	`ruc_cliente` VARCHAR(45),
	`direccion_cliente` VARCHAR(70),
	`fecha_registro_cliente` DATETIME,
	`fecha_ultima_actualizacion` DATETIME,
	fk_id_usuario_1 -- usuario que registro al cliente
	fk_id_estado_actividad_4 -- estado de cliente
);


-- TABLA MARCAS
CREATE TABLE `marcas`(
	`id_marca` INT(8) AUTO_INCREMENT,
	`nombre_marca` VARCHAR(45),
	`logo_marca` VARCHAR(45), -- ubicacion archivo
	`fecha_registro_marca` DATETIME,
	`fecha_ultima_actualizacion` DATETIME,
	fk_id_usuario_1 -- usuario que registro la marca
	fk_id_estado_actividad_21 -- estado de cliente
	fk_id_usuario_10
);


-- TABLA DE ETIQUETA DE LAVADO
CREATE TABLE `etiqueta_lavado`( --  revisar con esa tabla junto a etiqueta de lavado
	`id_etiqueta_lavado` INT(8) AUTO_INCREMENT,
	`imagen_etiqueta_lavado` VARCHAR(75), -- ubicacion del archivo
	`descripcion_etiqueta` VARCHAR
	`ancho_etiqueta_lavado` INT
	`largo_etiqueta_lavado` INT
	`fecha_registro_etiqueta` DATETIME,
	`fecha_ultima_actualizacion` DATETI ME,
	fk_id_usuario_2 -- usuario que registro
	fk_id_etiqueta_lavado_4
	fk_id_marca_1
);


-- TABLA INTERMEDIA DE ETIQUETAS DE LAVADO Y ESTILOS --> revisar esta tabla  falta completar contenido
CREATE TABLE `etiquetasLavado_estilo`( --
	fk_id_estilo
	fk_id_etiqueta_lavado
);


-- TABLA INTERMEDIA ETIQUETA LAVADO Y ORDEN DE PRODUCCION
CREATE TABLE `ordenProduccion_hangtags`(
	fk_id_orden_produccion_6
	fk_id_hangtag
);


-- TABLA INTERMEDIA ORDEN DE PRODUCCION Y AVIOS
CREATE TABLE `ordenProduccion_avios`(
	fk_id_orden_produccion_7
	fk_id_avios
);



-- TABLA AVIOS --> entidad
CREATE TABLE `avios`(  -- la programacion hara el calculo del total para lo que se necesita en avios
	`id_avios` INT(8) AUTO_INCREMENT,
	`nombre_avio` VARCHAR(20) --talleros, precios, hangtag,ganchos,
	`imagen_avio` INT(8),--sensores, bolsas,broches,tuil,hilo
	`fecha_registro_avios` DATETIME,
	`fecha_ultima_actualizacion` DATETIME, -- soguillas,elasticos,
	fk_id_cliente_
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA HANGTAGS
CREATE TABLE `hangtags`( -- Registros que llenan por usuario
	`id_hangtag` INT(8) AUTO_INCREMENT,
	`nombre_hangtag` VARCHAR(20) --talleros, precios, hangtag,ganchos,
	`imagen_hangtag` VARCHAR(8),--sensores, bolsas,broches,tuil,
	`ancho_hangtag` INT
	`largo_hangtag` INT
	`descripcion_hangtag` VARCHAR
	`cargar_archivo_hangtag` -- enlace de la ubicacion del archivo
	`fecha_registro_hangtag` DATETIME
	`fecha_ultima_actualizacion` DATETIME, -- soguillas,elasticos,
	fk_id_cliente_2
	fk_id_usuario_3
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA PEDIDOS DE HANGTAGS A TERCEROS --> SOLICITANDO
CREATE TABLE `hangtags_pedido`( -- Registros que llenan por usuario
	`id_pedido_hangtag` INT(8) AUTO_INCREMENT,
	`cantidad_hangtags` INT -- se supone incluye un redondeo por el solicitante
	`observaciones_pedido_hangtag`
	`fecha_registro_pedido_hangtag` DATETIME
	`fecha_ultima_actualizacion` DATETIME, -- soguillas,elasticos,
	fk_id_cliente_3
	fk_id_usuario_4
	fk_id_proveedor
	fk_id_hangtag
	fk_id_estado_actividad_5 -- estado de hangtag pedido
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA PROVEEDORES - INSUMOS O SERVICIOS
CREATE TABLE `proveedores`( -- Registros que llenan por usuario
	`id_proveedor` INT(8) AUTO_INCREMENT,
	`razon_social_proveedor` VARCHAR(45),
	`ruc_proveedor` VARCHAR(45),
	`rubro_proveedor` VARCHAR(45),
	`nombre_insumo_servicio` VARCHAR(45),
	`fecha_registro_proveedor` DATETIME,
	`fecha_ultima_actualizacion` DATETIME,
  fk_id_departamento
  fk_id_ciudad
  fk_id_distrito
  fk_id_calle
  fk_id_nacionalidad
	fk_id_usuario_5 -- usuario que registro al proveedor
	fk_id_usuario_representante -- usuario contacto intermediario
	fk_id_estado_actividad_6 -- estado de proveedor
);


-- TABLA INTERMEDIA PROVEEDORES Y TIPO TELEFONO
CREATE TABLE `proveedores_tipoTelefono`(
	fk_id_proveedor
	fk_id_tipo_telefono
	`numero_telefono` VARCHAR
);


-- TABLA INTERMEDIA HANGTAG Y PROVEEDORES
CREATE TABLE `hangtags_proveedores`(
	fk_id_hangtag
	fk_id_proveedor
);


-- TABLA INTERMEDIA ESTILOS Y COLORES_TELAS
CREATE TABLE `estilos_coloresTelas`(
	fk_id_estilo_1
	fk_id_color_tela
);


-- TABLA INTERMEDIA ESTILOS Y COLORES_TELAS
CREATE TABLE `estilos_coloresRip`(
	fk_id_estilo_2
	fk_id_color_rip
);


-- TABLA DE TIPO DE TELAS
CREATE TABLE `tipo_telas`(
	`id_tipo_tela` INT
	`tipo_tela` VARCHAR   -- jersey, gamuza, melange,
);


-- TABLA DE TIPO DE TEJIDO DE TELA
CREATE TABLE `tipo_tejidos`(   -- 30/1 - 24/1 - 20/1
	`id_tipo_tejido` INT
	`tipo_tejido` VARCHAR
);


-- TABLA COLOR DE TELAS
CREATE TABLE `colores_telas`(  -- Registros que llenan por usuario
	`id_color_tela` INT(8) AUTO_INCREMENT,
	`codigo_tela` VARCHAR(20),
	`partida_tela` VARCHAR(20),
	`color_tela_interno` VARCHAR(15),
	`nombre_color_tela_proveedor` VARCHAR(15),
	`porcentaje_componentes` VARCHAR(25), -- 100% algodon se completa en programacion
	`fecha_registro_tela` DATETIME,
	fk_id_tipo_tejido  -- 30/1 - 24/1 - 20/1
	fk_id_tipo_tela    -- jersey, gamuza, melange,
	fk_id_tipo_rollo  -- abierta, tubular,abierta
	fk_id_proveedor
 	fk_id_usuario_6
 	fk_id_estado_actividad_7  -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
);


-- TABLA COLOR DE RIP
CREATE TABLE `colores_rip`( -- Registros que llenan por usuario
	`id_color_rip` INT(8) AUTO_INCREMENT,
	`codigo_rip` VARCHAR(20),
	`partida_rip` VARCHAR(20),
	`color_rip_interno` VARCHAR(15),
	`nombre_color_rip_proveedor` VARCHAR(15),
	`porcentaje_componentes` VARCHAR(25), -- 100% algodon
	`fecha_registro_rip` DATETIME
	fk_id_tipo_tejido  -- 30/1 - 24/1 - 20/1
	fk_id_tipo_tela    -- jersey, gamuza, melange,
	fk_id_tipo_rollo  -- abierta, tubular,abierta
	fk_id_proveedor
	fk_id_usuario_7
	fk_id_estado_actividad_8  -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
);


-- TABLA GESTION TELAS --> entidad  - Jaime
CREATE TABLE `pedido_telas`( -- esto se mide a nivel de orden de produccion
	`id_pedido_tela` INT(8) AUTO_INCREMENT,  -- Registros que llenan por usuario
	`consumo_prenda` INT(8),
	`pedido_rollos` INT(8),
	`fecha_llegada_almacen_tela` DATETIME,
	`fecha_ultima_actualizacion` DATETIME,
	`observaciones_pedido_tela` VARCHAR(100),
	fk_id_orden_produccion
	fk_id_usuario_8
	fk_id_orden_guia_corte
	fk_id_estado_actividad  -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA ORDENES DE GUIA DE CORTE --> entidad -- Esta es la tabla principal
CREATE TABLE `ordenes_guias_cortes`( -- Registros que llenan por usuario
	`id_orden_guia_corte` INT(8) AUTO_INCREMENT,
	`numero_guia` INT
	`fecha_registro_guia_corte` DATETIME, -- fecha que se creo la guia
	`fecha_ultima_actualizacion` DATETIME,
	`observaciones_orden_guia_corte` VARCHAR(100),
	fk_id_usuario_9 --> registra Diego, Sra. Monica, Sebastian, etc.
	fk_id_estado_actividad_9  -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA CORTE DE TELAS - TENDIDO --> entidad - Isac
CREATE TABLE `corte_orden_telas`( -- REFIERE AL TENDIDO Y CORTE --> Registros que llenan por usuario
	`id_corte_orden_tela` INT(8) AUTO_INCREMENT,
	`capas_minimas` INT(8),
	`capas_maximas` INT(8),
	`corte_demasia` INT(8),
	`corte_fallados` INT,
	`ancho_rollo_tendido` INT -- resta 2 centimetros de cada extremo
	`largo_rollo_tendido` INT -- el largo lo da patronaje segun el tendido del sistema --> debe ser implementado despues
	`observaciones_corte_orden_tela` VARCHAR(100),
	`fecha_ingreso_corte_orden_tela` DATETIME,
	`fecha_ultima_actualizacion` DATETIME,
	fk_id_tipo_rollo
	fk_id_mesa_tendido -- mesa 1 / mesa 2 / mesa 3
	fk_id_estilo
	fk_id_orden_produccion
	fk_id_orden_guia_corte
	fk_id_usuario_10 --> Registra Isac, Luis, etc.
	fk_id_estado_actividad_10  -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA INTERMEDIA CORTE ORDEN DE TELAS CON TALLAS
CREATE TABLE `corteTelas_tallas`(
	fk_id_corte_orden_tela
	fk_id_talla
	`cantidad` INT -- cantidad por talla segun prenda
);


-- TABLA TIPO DE ROLLO
CREATE TABLE `tipo_rollo`(
	`id_tipo_rollo` INT
	`tipo_rollo` VARCHAR -- tela abierta / cerrada / tubular
);


-- TABLA MESAS DE TENDIDO Y CORTE
CREATE TABLE `mesa_tendido`( -- mesa 1 / mesa 2 / mesa 3
	`id_mesa_tendido` INT
	`nombre_mesa` VARCHAR
);


-- TABLA DISEÑO --
CREATE TABLE `diseno_micas`(
	`id_diseno_mica` INT(8) AUTO_INCREMENT,
	`nombre_referencia_diseno` VARCHAR(45),
	`colores_de_separacion` INT,
	`lineaje_de_impresion` VARCHAR(5),
	`ancho_mica_usada_impresion` INT,
	`largo_mica_usada_impresion` INT,
	`veces_de_impresion` INT,
	`imagen_diseno` VARCHAR(70), -- revisar si esta bien aqui
	`cambios_para_produccion` VARCHAR(500),
	`observaciones_diseno_produccion` VARCHAR(100),
	`fecha_de_impresion` DATETIME
	fk_id_impresora --> crear tabla de impresoras
	fk_id_usuario_11 --> registra la impresion de la mica
	fk_id_orden_produccion
	fk_id_estilo
	fk_id_orden_estampado_programacion -- revisar
	fk_id_codigos_orden_produccion
	fk_id_estado_actividad_11  -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
);


-- TABLA PLOTERS
CREATE TABLE `impresoras`( -- ploter 7880, ploter 7800, etc
	`id_impresora` INT
	`tipo_impresora` VARCHAR  -- ploter, impresora convensional, multifuncional
	`marca_impresora` -- epson , etc
	`serie_impresora` --7800, 7880 stylus , etc
	`formato_impresion` -- A4,A3,A5, rollo
	`ancho_bandeja` -- 60cm , 70cm, 120cm
	`material_impresion` -- micas,bond,micas y bond, etc
	`tipo_impresion` -- tinta, laser
);


-- TABLA PLOTER
CREATE TABLE `ploter`(
	`id_ploter` INT(8) AUTO_INCREMENT,
	`nombre_ploter` VARCHAR(45),
	`descripcion` DATETIME
	fk_id_estado_actividad_12  -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
);

-- TABLA TECNICAS DE ESTAMPADO
CREATE TABLE `tecnicas_estampado`(  -- puff - glitter - plano - dischard - suave - covertura etc
	`id_tecnica_estampado` INT(8) AUTO_INCREMENT, -- PUFF,GLITTER,SUGAR,SPAY_FLEY,ETC
	`nombre_tecnica_estampado` VARCHAR
	`descripcion_tecnica` VARCHAR
	`foto_tecnica` VARCHAR
	`fecha_registro_tecnica_estampado` DATETIME
	`fecha_ultima_actualizacion` DATETIME
	fk_id_usuario_13
);


-- TABLA ETIQUETA ESTAMPADA
CREATE TABLE `etiquetas_estampadas`(
	`id_etiqueta_estampada` INT(8) AUTO_INCREMENT,
	`nombre_etiqueta_estampada` VARCHAR
	`foto_etiqueta_estampada` VARCHAR
	`fecha_registro_etiqueta_estampada` DATETIME
	`fecha_ultima_actualizacion` DATETIME
	fk_id_cliente_4
	fk_id_usuario_14
);


-- TABLA MAQUINAS Y ESTAMPADO
CREATE TABLE `maquinas_estampado`(   -- maquina1, maquina2,maquina3,maquina4_etiquetera
	`id_maquina_estampado` INT(8) AUTO_INCREMENT,
	`nombre_maquina` VARCHAR
	`descripcion_maquina` VARCHAR
	`produccion_aprox_dia` INT
	`ancho_plato` INT
	`largo_plato` INT
	`brazos_maquina_estampado` INT
	`fecha_registro_maquina_estampado` DATETIME
	`fecha_ultima_actualizacion` DATETIME
	fk_id_estado_actividad_13  -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
);


-- TABLA REVELADO ESTAMPADO
CREATE TABLE `revelado_estampado`( -- solo para confirmar la tarea
	`id_revelado_estampado` INT(8) AUTO_INCREMENT, -- implementar posteriormente esta tabla
	`cantidad_cuadros` INT
	`emulsion_usada` VARCHAR
	`fecha_registro_revelado_estampado` DATETIME
	`fecha_ultima_actualizacion` DATETIME
	fk_id_maquina_estampado
	fk_id_usuario_15
	fk_id_estilo
	fk_id_diseno_mica
	fk_id_patronaje_molde  -- verificar si es necesario
	fk_id_orden_produccion
	fk_id_etiqueta_estampada
	fk_id_estado_actividad_14  -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
);


-- TABLA MUESTRAS ESTAMPADO APROBADA PARA PRODUCCION
CREATE TABLE `muestras_estampado`(
	`id_muestra_estampado` INT(8) AUTO_INCREMENT,
	`comentarios_muestra` VARCHAR
	`fecha_registro_muestra_estampado` DATETIME
	`fecha_ultima_actualizacion` DATETIME
	fk_id_estilo
	fk_id_orden_produccion
	fk_id_patronaje_molde  -- verificar si es necesario
	fk_id_estado_actividad -- muestra enviada
);


-- TABLA PLANCHADO
CREATE TABLE `planchado`(
	`id_planchado` INT(8) AUTO_INCREMENT,
	`cantidad_planchado` INT
	`temperatura` VARCHAR
	`tiempo_plancha` INT
	`observaciones_planchado` VARCHAR
	`fecha_registro_planchado` DATETIME
	`fecha_ultima_actualizacion` DATETIME
	fk_id_estilo
	fk_id_orden_produccion
	fk_id_patronaje_molde
	fk_id_usuario_17
	fk_id_estado_actividad_16  -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
);


-- TABLA ORDEN ESTAMPADO PROGRAMACION
CREATE TABLE `orden_estampado_programacion`( -- ordenar por maquina x fecha x recursos
	`id_orden_estampado_programacion` INT(8) AUTO_INCREMENT,
	`observaciones_programacion` VARCHAR
	`fecha_registro_programacion` DATETIME --> fecha registro de tarea
	fk_id_estilo
	fk_id_orden_produccion
	fk_id_ordene_guia_corte
	fk_id_muestra_estampado
	fk_id_maquina_estampado -- maquina asignada
	fk_id_estado_actividad_17  -- estado terminado o no --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
	fk_id_estado_actividad -- Jerarquia --> urgente / muy urgente / programado
);


-- TABLA INTERMEDIA ORDEN ESTAMPADO PROGRAMACION Y  USUARIO
CREATE TABLE `programacion_usuario`( -- cambia constante la programacion
	fk_id_orden_estampado_programacion
	fk_id_usuario
	`hora_inicio` TIME -- revisar si es valido este dato o comose maneja
	`hora_fin` TIME -- revisar si es valido este dato o comose maneja
	`fecha_produccion` DATETIME --> dia que se realiza produccion
	`fecha_ultima_actualizacion` VARCHAR --> ultima fecha de cambios
);


-- TABLA ESTADOS PROCESOS  --> para todos los estados de procesos
CREATE TABLE `estados_actividad`( -- pendiente-gris / confirmado-verde / en proceso-amarillo / atrazado-rojo / finalizado-azul
	`id_estado_actividad` INT(8) AUTO_INCREMENT, -- estado persona --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
	`nombre_estado` VARCHAR -- estado usuario --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
	`fecha_ultima_actualizacion` VARCHAR
	fk_id_usuario_19
);


-- TABLA REGISTRO DE CONTROL DE ENVIOS Y RECEPCION --> CON ESTO LA AREA DISTRIBUCION SE AUTOMATIZA
CREATE TABLE `control_envios_recepcion`( -- Magaly recibe --> eti.lavado, tela de corte, ecia
	`id_control_envio` INT(8) AUTO_INCREMENT,
	`cantidad_total` INT -- se contabiliza el total por envio
	`descripcion` VARCHAR -- descripcion simple de lo que se recibe
	`fecha_registro_queEnvia` DATETIME
	`fecha_ultima_actualizacion` VARCHAR
	fk_id_usuario_queEnvia -- Luis, Isac, chato
	fk_id_area_trabajo_envia -- Area que envia el producto en proceso
	fk_id_usuario_queRecibe -- Magaly
	fk_id_area_trabajo_recibe -- Area que recibe el producto en proceso
	fk_id_estado_actividad_producto -- El que recibe confirma --> calidad, defectuoso, necesita correcciones, volver a hacer
	fk_id_estado_actividad_confirmacion -- El que recibe confirma --> llegada
);


-- TABLA INTERMEDIA ENTRE CONTROL DE ENVIOS Y  ETIQUETA DE LAVADO
CREATE TABLE `envios_etiquetaLavado`(
	fk_id_control_envio
	fk_id_etiqueta_lavado
	`cantidad_enviada` INT -- se contabiliza los cortes o prendas en proceso y registra
);


-- TABLA INTERMEDIA ENTRE CONTROL DE ENVIOS Y  AVIOS
CREATE TABLE `envios_avios`(
	fk_id_control_envio
	fk_id_avios
	`cantidad_enviada` INT -- se contabiliza los cortes o prendas en proceso y registra
);


-- TABLA INTERMEDIA ENTRE CONTROL DE ENVIOS Y HANGTAG
CREATE TABLE `envios_hangtags`(
	fk_id_control_envio
	fk_id_hangtag
	`cantidad_enviada` INT -- se contabiliza los cortes o prendas en proceso y registra
);


-- TABLA INTERMEDIA ENTRE CONTROL DE ENVIOS Y CORTE ORDE DE TALAS
CREATE TABLE `envios_corteOrdenTela`(
	fk_id_control_envio
	fk_id_corte_orden_tela
	fk_id_patronaje_molde
	`cantidad_enviada` INT -- se contabiliza los cortes o prendas en proceso y registra
);


-- TABLA INTERMEDIA ENTRE CONTROL DE ENVIOS Y DISEÑO MICAS
CREATE TABLE `envios_disenoMicas`(
	fk_id_control_envio
	fk_id_diseno_mica
	`cantidad_enviada` INT -- se contabiliza los cortes o prendas en proceso y registra
);


-- TABLA INTERMEDIA ENTRE CONTROL DE ENVIOS Y REVELADO DE CUADROS
CREATE TABLE `envios_reveladoEstampado`(
	fk_id_control_envio
	fk_id_revelado_estampado
	`cantidad_enviada` INT -- se contabiliza los cortes o prendas en proceso y registra
);


-- TABLA INTERMEDIA ENTRE CONTROL DE ENVIOS Y REVELADO DE CUADROS
CREATE TABLE `envios_muestraEstampado`(
	fk_id_control_envio
	fk_id_muestra_estampado
	`cantidad_enviada` INT -- se contabiliza los cortes o prendas en proceso y registra
);


-- TABLA INTERMEDIA ENTRE CONTROL DE ENVIOS Y REVELADO DE CUADROS
CREATE TABLE `envios_planchado`(
	fk_id_control_envio
	fk_id_planchado
	`cantidad_enviada` INT -- se contabiliza los cortes o prendas en proceso y registra
);


-- TABLA PAISES Y NACIONALIDADES
CREATE TABLE `paises`(
	`id_pais` INT
	`nombre_pais` VARCHAR
  `nombre_nacionalidad` VARCHAR
);




-- INICIAN TABLAS DE PATRONAJE --

-- TABLA PATRONAJE Y MOLDES
CREATE TABLE `patronaje_moldes`( -- muestra tambien Ubicacion de diseño total, parcial, pecho, espalda
	`id_patronaje_molde` INT(8) AUTO_INCREMENT,
  `descripcion` VARCHAR(70),
	`fecha_registro_patronaje_molde` DATETIME
	`fecha_ultima_actualizacion` DATETIME
  fk_id_usuario_22 -- usuario que genera el registro
  fk_id_orden_guia_corte --> referencia principal
	fk_id_orden_produccion_3
  fk_id_estilo
  fk_id_etiqueta_lavado
	fk_id_etiqueta_estampada
	fk_id_tipo_prenda_3
	fk_id_cliente
	fk_id_estilo
	fk_id_pais
	fk_id_marca
  fk_id_estado_actividad_19  -- estado proceso --> activo - verde / usuario transitivo o temporal - naranja / inactivo - rojo
  fk_id_orden_produccion
);


-- TABLA INTERMEDIA ESTILOS Y TALLAS
CREATE TABLE `patronajeMoldes_tallas`(
	fk_id_patronaje_molde
	fk_id_talla
	`curva_talla` INT
);


-- TABLA MEDIDAS DE PRENDA PARA CONFECCION
CREATE TABLE `medidas_prenda_confeccion`(
	`id_medias_prenda_confeccion` INT
	`numero_molde` VARCHAR
  `proceso` VARCHAR -- estampado delantero y etiqueta en espalda interna
  `imagen_referencia` VARCHAR -- FORMA DE MEDIR - imagen de la ubicaion de las medidas
	`fecha_registro` DATETIME
  `fecha_ultima_actualizacion` DATETIME
	fk_id_patronaje_molde
);


-- TABLA INTERMEDIA MEDIDA DE PRENDAS DE CONFECCION Y TALLAS
CREATE TABLE `medidaPrendas_tallas`(
  fk_id_medias_prenda_confeccion
  fk_id_talla -- agreagar en la tabla de tallas el campo TOLERANCIA +/-
  `medida` DECIMAL -- ver que valor corresponde si float o decimal
);


-- TABLA INTERMEDIA MEDIDAS DE PRENDA DE CONFECCION Y CODIGO DE MEDIDA
CREATE TABLE `medidasPrendas_codigoMedida`(
  fk_id_medias_prenda_confeccion
  fk_id_codigo_medidas
  `descripcion_medidas` VARCHAR
  `tolerancia` DECIMAL -- TOL +/-  0.5 etc
);

-- TABLA DE CODIGOS DE MEDIDAS DE patronaje
CREATE TABLE `codigoMedidas_patronaje`(
  `id_codigo_medidas`INT
  `codigo_nombre` VARCHAR -- A,B,C,D,E,F,G,H,I,J, ETC
);



-- TABLA DE CONSTRUCCION DE PRENDAS
CREATE TABLE `construcion_prendas`(
  `id_construccion_prendas` INT
  `observaciones` VARCHAR
  `fecha_registro` DATETIME
  `fecha_ultima_actualizacion` DATETIME
  fk_id_etiqueta_lavado
  fk_id_medias_prenda_confeccion
  fk_id_orden_produccion
);

-- TABLA INTERMEDIA CONSTRUCION DE PRENDAS Y COMNTARIO DE ETIQUEA DE LAVADO
CREATE TABLE `construcionPrenda_etiquetaLavado`(
	fk_id_construccion_prendas
	fk_id_etiqueta_lavado
	`comentario_ubicacion` VARCHAR
);

-- TABLA INTERMEDIA CONSTRUCCION DE PRENDAS Y TIPO DE prendas
CREATE TABLE `construccionPreda_tipoPrenda`(
  fk_id_construccion_prendas
  fk_id_vista_prenda -- frontal,delantero, espalda, back
  `imagen_referencia` VARCHAR -- imagen de la prenda
);

-- TABLA INTERMEDIA CONSTRUCCION DE PRENDA Y PIEZA DE PRENDAS
CREATE TABLE `construccionPrenda_piezas`(
  fk_id_construccion_prendas
  fk_id_pieza_prenda -- delantero, espalda, manga,basta,cuello etc
  fk_id_tipo_tela -- jersey
  fk_id_color_tela
  `descripcion_contruccion` VARCHAR -- detalla medidas y  mas
  `consumo_metros` VARCHAR -- CONSUMO DE CUELLO X METRO - 1 MT PARA 70 PRENDAS / CONSUMO DE TAPETE X METRO - 1 MT PARA 130 PRENDAS
  `cantidad_piezas` VARCHAR -- 1 pieza / 2 piezas /
);

-- TABLA INTERMEDIA CONSTRUCCION DE PRENDA Y TELA COMPLEMENTO
CREATE TABLE `construccionPrenda_telaComplemento`(
  fk_id_construccion_prendas
  fk_id_telaComplemento
  fk_id_tipo_tela -- jersey
  fk_id_color_rip  --> RIB 1x1 / 2x2 etc
  `descripcion_contruccion` VARCHAR -- detalla medidas y  mas
  `consumo_metros` VARCHAR -- CONSUMO DE CUELLO X METRO - 1 MT PARA 70 PRENDAS / CONSUMO DE TAPETE X METRO - 1 MT PARA 130 PRENDAS
  `cantidad_piezas` VARCHAR -- en cintera / otros
);

-- TABLA DE CUELLO Y TAPETES
CREATE TABLE `telaComplemento`( --> RIB 1x1 / 2x2 etc
  `id_telaComplemento` INT -- piezas de prenda complemento
  `nombre_telaComplemento` VARCHAR -- cuello / tapetera / parches / otros
);

-- TABLA VISTAS DE PRENDA
CREATE TABLE `vistas_prenda`(
  `id_vista_prenda` INT
  `vista_prenda` VARCHAR -- frontal,delantero, espalda, back
);

-- TABLA DE UBICACION DE PIEZAS DE PRENDAS
CREATE TABLE `piezas_prendas`(
  `id_pieza_prenda` INT
  `pieza_prenda` VARCHAR  -- delantero, espalda, manga,cuello, etc
);

-- TABLA DE COSTURAS
CREATE TABLE `costuras`(
  `id_costuras`INT
  `codigo_nombre` VARCHAR -- recta, remalle, mellicera, recubierto,tapetera ETC
);

-- TABLA INTERMEDIA CONSTRUCCION Y  COSTURAS
CREATE TABLE `construcionPrenda_costuras`(
	fk_id_construccion_prendas
	fk_id_costuras
	`puntada` INT -- 12 ppp, 14 ppp, etc
);

-- TABLA INTERMEDIA CONSTRUCCION Y AVIOS
CREATE TABLE `construcionPrenda_avios`(
	fk_id_construccion_prendas
	fk_id_avios
	`descripcion` VARCHAR
	`medida_cantidad` VARCHAR
);



-- TABLA DE ETIQUETAS ESTAMPADAS Y fecha_registro_tecnica_estampado
CREATE TABLE `ubicaion_artes`(
  `id_ubicaion_artes` INT
  `imagen_referencial` VARCHAR -- ubicaion de etiqueta estampada
  `observaciones_etiqueta` VARCHAR -- ubicaion
  `colorPantone` VARCHAR -- color referencial para estampado
  `fecha_registro` DATETIME
  `fecha_ultima_actualizacion` DATETIME
  fk_id_etiqueta_lavado
  fk_id_etiqueta_estampada
  fk_id_construccion_prendas
  fk_id_orden_produccion
);



-- TABLA DE MEDIDAS ACABADAS PARA CONFECCION
CREATE TABLE `medidas_acabadas_confeccion`(
	`id_medias_acabadas_confeccion` INT
	`descripcion` VARCHAR
	`fecha_registro` DATETIME
  `fecha_ultima_actualizacion` DATETIME
	fk_id_medias_prenda_confeccion
);


-- TABLA INTERMEDIA MEDIDA DE PRENDAS DE CONFECCION Y TALLAS
CREATE TABLE `medidasAcabadas_tallas`(
  fk_id_medias_acabadas_confeccion
  fk_id_talla -- agreagar en la tabla de tallas el campo TOLERANCIA +/-
  `medida` DECIMAL -- ver que valor corresponde si float o decimal
);


-- TABLA INTERMEDIA MEDIDAS DE PRENDA DE CONFECCION Y CODIGO DE MEDIDA
CREATE TABLE `medidasAcabadas_codigoMedida`(
  fk_id_medias_acabadas_confeccion
  fk_id_codigo_medidas
  `descripcion_medidas` VARCHAR
  `tolerancia` DECIMAL -- TOL +/-  0.5 etc
);

-- FIN DE TABLAS DE PATRONAJE




-- INICIAN TABLAS DE CODIGOS Y PRECIOS --


-- TABLA CODIGO PRENDA DE PRODUCCION  -- revisar si funciona almanezar objetos JSON como texto plano
CREATE TABLE `codigos_prenda_produccion`( -- revisar el ingreso de datos de codigos
	`id_codigo_prenda_produccion` INT(8) AUTO_INCREMENT,
	`descripcion` VARCHAR
  `contenido_plano_JSON` VARCHAR -- codigos en texto JSON plano
	`fecha_registro_codigo_prenda_produccion` DATETIME
	`fecha_ultima_actualizacion` VARCHAR
	fk_id_usuario_24  -- usuario que registra
	fk_id_orden_produccion_5
	fk_id_estado_actividad -- Jerarquia --> urgente / muy urgente / programado
);

-- FIN DE TABLAS DE CODIGOS Y PRECIOS




-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_estilos`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_estilo
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_ordenProduccion`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_orden_produccion
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_pedidoHangtags`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_pedido_hangtag
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_pedidoTelas`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_pedido_tela
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_ordenGuiaCorte`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_orden_guia_corte
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_corteOrdenTela`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_corte_orden_tela
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_disenoMica`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_diseno_mica
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_reveladoEstamapdo`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_revelado_estampado
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_muestraEstamapdo`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_muestra_estampado
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_planchado`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_planchado
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_ordenProgramacion`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_orden_estampado_programacion
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_patronajeMolde`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_patronaje_molde
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;


-- TABLA COMENTARIOS DE USUARIOS --> entidad
CREATE TABLE `comentarios_controlEnvios`( -- revisar si todas las tablas estan aqui
	`id_comentario` INT(8) AUTO_INCREMENT,
	`comentario` VARCHAR 500
	`fecha_comentario` DATETIME
	fk_id_usuario_20
	fk_id_control_envio
)ENGINE=InnoDB DEFAULT CHARSET=utf8_spanish_ci;
