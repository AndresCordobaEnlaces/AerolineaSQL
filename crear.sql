-- Creación de tablas, secuencias y restricciones. Incluye los DROP TABLE correspondientes al inicio para facilitar la re-ejecución.
CREATE TABLE aerolineas (
    id_aerolinea NUMBER(6),
    nombre       VARCHAR2(60) NOT NULL,
    pais         VARCHAR2(50) NOT NULL,
    codigo_iata  CHAR(2) NOT NULL,
    telefono     VARCHAR2(20),

    CONSTRAINT pk_aerolineas PRIMARY KEY (id_aerolinea),
    CONSTRAINT uq_aerolineas_nombre UNIQUE (nombre),
    CONSTRAINT uq_aerolineas_iata UNIQUE (codigo_iata)
);

CREATE TABLE aviones (
    id_avion     NUMBER(6),
    matricula    VARCHAR2(15) NOT NULL,
    modelo       VARCHAR2(50) NOT NULL,
    capacidad    NUMBER(4) NOT NULL,
    id_aerolinea NUMBER(6) NOT NULL,

    CONSTRAINT pk_aviones PRIMARY KEY (id_avion),
    CONSTRAINT uq_aviones_matricula UNIQUE (matricula),
    CONSTRAINT ck_aviones_capacidad CHECK (capacidad > 0),
    CONSTRAINT fk_aviones_aerolineas FOREIGN KEY (id_aerolinea)
        REFERENCES aerolineas(id_aerolinea)
);

CREATE TABLE terminales (
    id_terminal NUMBER(6),
    nombre      VARCHAR2(30) NOT NULL,
    zona        VARCHAR2(40) NOT NULL,

    CONSTRAINT pk_terminales PRIMARY KEY (id_terminal),
    CONSTRAINT uq_terminales_nombre UNIQUE (nombre)
);

CREATE TABLE puertas_embarque (
    id_puerta     NUMBER(6),
    codigo_puerta VARCHAR2(10) NOT NULL,
    estado        VARCHAR2(20) DEFAULT 'LIBRE' NOT NULL,
    id_terminal   NUMBER(6) NOT NULL,

    CONSTRAINT pk_puertas_embarque PRIMARY KEY (id_puerta),
    CONSTRAINT uq_puertas_codigo UNIQUE (codigo_puerta),
    CONSTRAINT ck_puertas_estado CHECK (estado IN ('LIBRE', 'OCUPADA', 'MANTENIMIENTO')),
    CONSTRAINT fk_puertas_terminales FOREIGN KEY (id_terminal)
        REFERENCES terminales(id_terminal)
);

CREATE TABLE pasajeros (
    id_pasajero      NUMBER(6),
    dni_pasaporte    VARCHAR2(20) NOT NULL,
    nombre           VARCHAR2(40) NOT NULL,
    apellidos        VARCHAR2(70) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    nacionalidad     VARCHAR2(40) NOT NULL,
    telefono         VARCHAR2(20),
    email            VARCHAR2(80),

    CONSTRAINT pk_pasajeros PRIMARY KEY (id_pasajero),
    CONSTRAINT uq_pasajeros_dni UNIQUE (dni_pasaporte),
    CONSTRAINT uq_pasajeros_email UNIQUE (email)
);

CREATE TABLE vuelos (
    id_vuelo      NUMBER(6),
    codigo_vuelo  VARCHAR2(10) NOT NULL,
    origen        VARCHAR2(50) NOT NULL,
    destino       VARCHAR2(50) NOT NULL,
    fecha_salida  DATE NOT NULL,
    fecha_llegada DATE NOT NULL,
    estado        VARCHAR2(20) DEFAULT 'PROGRAMADO' NOT NULL,
    precio_base   NUMBER(8,2) NOT NULL,
    id_aerolinea  NUMBER(6) NOT NULL,
    id_avion      NUMBER(6) NOT NULL,
    id_terminal   NUMBER(6) NOT NULL,
    id_puerta     NUMBER(6) NOT NULL,

    CONSTRAINT pk_vuelos PRIMARY KEY (id_vuelo),
    CONSTRAINT uq_vuelos_codigo UNIQUE (codigo_vuelo),
    CONSTRAINT ck_vuelos_origen_destino CHECK (origen <> destino),
    CONSTRAINT ck_vuelos_fechas CHECK (fecha_llegada > fecha_salida),
    CONSTRAINT ck_vuelos_precio CHECK (precio_base >= 0),
    CONSTRAINT ck_vuelos_estado CHECK (
        estado IN (
            'PROGRAMADO',
            'EMBARCANDO',
            'EN_VUELO',
            'RETRASADO',
            'CANCELADO',
            'FINALIZADO'
        )
    ),
    CONSTRAINT fk_vuelos_aerolineas FOREIGN KEY (id_aerolinea)
        REFERENCES aerolineas(id_aerolinea),
    CONSTRAINT fk_vuelos_aviones FOREIGN KEY (id_avion)
        REFERENCES aviones(id_avion),
    CONSTRAINT fk_vuelos_terminales FOREIGN KEY (id_terminal)
        REFERENCES terminales(id_terminal),
    CONSTRAINT fk_vuelos_puertas FOREIGN KEY (id_puerta)
        REFERENCES puertas_embarque(id_puerta)
);

CREATE TABLE reservas (
    id_reserva    NUMBER(6),
    fecha_reserva DATE DEFAULT SYSDATE NOT NULL,
    estado        VARCHAR2(20) DEFAULT 'ACTIVA' NOT NULL,
    importe_total NUMBER(8,2) NOT NULL,
    id_pasajero   NUMBER(6) NOT NULL,
    id_vuelo      NUMBER(6) NOT NULL,

    CONSTRAINT pk_reservas PRIMARY KEY (id_reserva),
    CONSTRAINT ck_reservas_estado CHECK (estado IN ('ACTIVA', 'CANCELADA', 'PAGADA')),
    CONSTRAINT ck_reservas_importe CHECK (importe_total >= 0),
    CONSTRAINT uq_reserva_pasajero_vuelo UNIQUE (id_pasajero, id_vuelo),
    CONSTRAINT fk_reservas_pasajeros FOREIGN KEY (id_pasajero)
        REFERENCES pasajeros(id_pasajero)
        ON DELETE CASCADE,
    CONSTRAINT fk_reservas_vuelos FOREIGN KEY (id_vuelo)
        REFERENCES vuelos(id_vuelo)
        ON DELETE CASCADE
);

CREATE TABLE billetes (
    id_billete     NUMBER(6),
    numero_billete VARCHAR2(20) NOT NULL,
    asiento        VARCHAR2(5) NOT NULL,
    clase          VARCHAR2(20) NOT NULL,
    fecha_emision  DATE DEFAULT SYSDATE NOT NULL,
    id_reserva     NUMBER(6) NOT NULL,

    CONSTRAINT pk_billetes PRIMARY KEY (id_billete),
    CONSTRAINT uq_billetes_numero UNIQUE (numero_billete),
    CONSTRAINT uq_billetes_reserva UNIQUE (id_reserva),
    CONSTRAINT ck_billetes_clase CHECK (clase IN ('TURISTA', 'BUSINESS', 'PRIMERA')),
    CONSTRAINT fk_billetes_reservas FOREIGN KEY (id_reserva)
        REFERENCES reservas(id_reserva)
        ON DELETE CASCADE
);

CREATE TABLE equipajes (
    id_equipaje NUMBER(6),
    peso        NUMBER(5,2) NOT NULL,
    tipo        VARCHAR2(20) NOT NULL,
    estado      VARCHAR2(20) DEFAULT 'REGISTRADO' NOT NULL,
    id_pasajero NUMBER(6) NOT NULL,
    id_vuelo    NUMBER(6) NOT NULL,

    CONSTRAINT pk_equipajes PRIMARY KEY (id_equipaje),
    CONSTRAINT ck_equipajes_peso CHECK (peso > 0),
    CONSTRAINT ck_equipajes_tipo CHECK (tipo IN ('MANO', 'FACTURADO', 'ESPECIAL')),
    CONSTRAINT ck_equipajes_estado CHECK (
        estado IN ('REGISTRADO', 'EMBARCADO', 'PERDIDO', 'ENTREGADO')
    ),
    CONSTRAINT fk_equipajes_pasajeros FOREIGN KEY (id_pasajero)
        REFERENCES pasajeros(id_pasajero)
        ON DELETE CASCADE,
    CONSTRAINT fk_equipajes_vuelos FOREIGN KEY (id_vuelo)
        REFERENCES vuelos(id_vuelo)
        ON DELETE CASCADE
);

CREATE TABLE empleados (
    id_empleado NUMBER(6),
    dni         VARCHAR2(15) NOT NULL,
    nombre      VARCHAR2(40) NOT NULL,
    apellidos   VARCHAR2(70) NOT NULL,
    puesto      VARCHAR2(30) NOT NULL,
    salario     NUMBER(8,2) NOT NULL,
    fecha_alta  DATE DEFAULT SYSDATE NOT NULL,
    id_terminal NUMBER(6) NOT NULL,

    CONSTRAINT pk_empleados PRIMARY KEY (id_empleado),
    CONSTRAINT uq_empleados_dni UNIQUE (dni),
    CONSTRAINT ck_empleados_puesto CHECK (
        puesto IN (
            'SEGURIDAD',
            'FACTURACION',
            'EMBARQUE',
            'MANTENIMIENTO',
            'ADMINISTRACION'
        )
    ),
    CONSTRAINT ck_empleados_salario CHECK (salario >= 0),
    CONSTRAINT fk_empleados_terminales FOREIGN KEY (id_terminal)
        REFERENCES terminales(id_terminal)
);

CREATE TABLE turnos_empleados (
    id_turno    NUMBER(6),
    fecha_turno DATE NOT NULL,
    hora_inicio DATE NOT NULL,
    hora_fin    DATE NOT NULL,
    tipo_turno  VARCHAR2(20) NOT NULL,
    id_empleado NUMBER(6) NOT NULL,

    CONSTRAINT pk_turnos_empleados PRIMARY KEY (id_turno),
    CONSTRAINT ck_turnos_horas CHECK (hora_fin > hora_inicio),
    CONSTRAINT ck_turnos_tipo CHECK (tipo_turno IN ('MANANA', 'TARDE', 'NOCHE')),
    CONSTRAINT fk_turnos_empleados FOREIGN KEY (id_empleado)
        REFERENCES empleados(id_empleado)
        ON DELETE CASCADE
);

CREATE TABLE auditoria_vuelos (
    id_auditoria    NUMBER(6),
    id_vuelo        NUMBER(6),
    estado_anterior VARCHAR2(20),
    estado_nuevo    VARCHAR2(20),
    fecha_cambio    DATE DEFAULT SYSDATE NOT NULL,
    usuario_bd      VARCHAR2(40) NOT NULL,

    CONSTRAINT pk_auditoria_vuelos PRIMARY KEY (id_auditoria),
    CONSTRAINT fk_auditoria_vuelos FOREIGN KEY (id_vuelo)
        REFERENCES vuelos(id_vuelo)
        ON DELETE SET NULL
);

CREATE SEQUENCE seq_aerolineas
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_aviones
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_terminales
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_puertas
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_vuelos
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_pasajeros
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_reservas
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_billetes
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_equipajes
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_empleados
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_turnos
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_auditoria_vuelos
START WITH 1
INCREMENT BY 1
NOCACHE;