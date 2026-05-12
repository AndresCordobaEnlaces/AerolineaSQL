-- Datos de ejemplo suficientes para que todas las consultas devuelvan resultados.
INSERT INTO aerolineas VALUES (seq_aerolineas.NEXTVAL, 'Iberia', 'España', 'IB', '900100100');
INSERT INTO aerolineas VALUES (seq_aerolineas.NEXTVAL, 'Vueling', 'España', 'VY', '900200200');
INSERT INTO aerolineas VALUES (seq_aerolineas.NEXTVAL, 'Ryanair', 'Irlanda', 'FR', '900300300');
INSERT INTO aerolineas VALUES (seq_aerolineas.NEXTVAL, 'Air Europa', 'España', 'UX', '900400400');
INSERT INTO aerolineas VALUES (seq_aerolineas.NEXTVAL, 'Lufthansa', 'Alemania', 'LH', '900500500');

INSERT INTO aviones VALUES (seq_aviones.NEXTVAL, 'EC-AAA', 'Airbus A320', 180, 1);
INSERT INTO aviones VALUES (seq_aviones.NEXTVAL, 'EC-BBB', 'Airbus A321', 220, 1);
INSERT INTO aviones VALUES (seq_aviones.NEXTVAL, 'EC-CCC', 'Airbus A320neo', 186, 2);
INSERT INTO aviones VALUES (seq_aviones.NEXTVAL, 'EI-DDD', 'Boeing 737-800', 189, 3);
INSERT INTO aviones VALUES (seq_aviones.NEXTVAL, 'EI-EEE', 'Boeing 737 MAX', 197, 3);
INSERT INTO aviones VALUES (seq_aviones.NEXTVAL, 'EC-FFF', 'Boeing 787', 296, 4);
INSERT INTO aviones VALUES (seq_aviones.NEXTVAL, 'D-GGG', 'Airbus A320', 180, 5);
INSERT INTO aviones VALUES (seq_aviones.NEXTVAL, 'D-HHH', 'Airbus A350', 300, 5);

INSERT INTO terminales VALUES (seq_terminales.NEXTVAL, 'Terminal 1', 'Nacional');
INSERT INTO terminales VALUES (seq_terminales.NEXTVAL, 'Terminal 2', 'Internacional');
INSERT INTO terminales VALUES (seq_terminales.NEXTVAL, 'Terminal 3', 'Bajo coste');
INSERT INTO terminales VALUES (seq_terminales.NEXTVAL, 'Terminal 4', 'Largo radio');

INSERT INTO puertas_embarque VALUES (seq_puertas.NEXTVAL, 'A1', 'LIBRE', 1);
INSERT INTO puertas_embarque VALUES (seq_puertas.NEXTVAL, 'A2', 'LIBRE', 1);
INSERT INTO puertas_embarque VALUES (seq_puertas.NEXTVAL, 'B1', 'LIBRE', 2);
INSERT INTO puertas_embarque VALUES (seq_puertas.NEXTVAL, 'B2', 'LIBRE', 2);
INSERT INTO puertas_embarque VALUES (seq_puertas.NEXTVAL, 'C1', 'LIBRE', 3);
INSERT INTO puertas_embarque VALUES (seq_puertas.NEXTVAL, 'C2', 'MANTENIMIENTO', 3);
INSERT INTO puertas_embarque VALUES (seq_puertas.NEXTVAL, 'D1', 'LIBRE', 4);
INSERT INTO puertas_embarque VALUES (seq_puertas.NEXTVAL, 'D2', 'LIBRE', 4);

INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, '12345678A', 'Andrés', 'Córdoba García', TO_DATE('2005-04-12', 'YYYY-MM-DD'), 'Española', '600111111', 'andres@example.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, '23456789B', 'Lucía', 'Martínez López', TO_DATE('1998-06-20', 'YYYY-MM-DD'), 'Española', '600222222', 'lucia@example.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, '34567890C', 'Carlos', 'Pérez Ruiz', TO_DATE('1987-11-03', 'YYYY-MM-DD'), 'Española', '600333333', 'carlos@example.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, '45678901D', 'María', 'Sánchez Torres', TO_DATE('1992-01-15', 'YYYY-MM-DD'), 'Española', '600444444', 'maria@example.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, '56789012E', 'Javier', 'Gómez Díaz', TO_DATE('1979-09-08', 'YYYY-MM-DD'), 'Española', '600555555', 'javier@example.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, '66889977F', 'Elena', 'Navarro Gil', TO_DATE('2001-03-25', 'YYYY-MM-DD'), 'Española', '600666666', 'elena@example.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, '77889966G', 'Paula', 'Romero Vega', TO_DATE('1995-12-10', 'YYYY-MM-DD'), 'Española', '600777777', 'paula@example.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, '88997766H', 'Miguel', 'Herrera Cano', TO_DATE('1984-07-19', 'YYYY-MM-DD'), 'Española', '600888888', 'miguel@example.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, '99887766I', 'Sofía', 'Morales León', TO_DATE('1999-05-30', 'YYYY-MM-DD'), 'Española', '600999999', 'sofia@example.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, '11223344J', 'Daniel', 'Castro Molina', TO_DATE('1990-02-14', 'YYYY-MM-DD'), 'Española', '601111111', 'daniel@example.com');

INSERT INTO vuelos VALUES (seq_vuelos.NEXTVAL, 'IB1001', 'Madrid', 'Barcelona', TO_DATE('2026-06-01 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-01 09:15', 'YYYY-MM-DD HH24:MI'), 'PROGRAMADO', 95.50, 1, 1, 1, 1);
INSERT INTO vuelos VALUES (seq_vuelos.NEXTVAL, 'IB1002', 'Madrid', 'París', TO_DATE('2026-06-01 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-01 12:05', 'YYYY-MM-DD HH24:MI'), 'PROGRAMADO', 160.00, 1, 2, 2, 3);
INSERT INTO vuelos VALUES (seq_vuelos.NEXTVAL, 'VY2001', 'Barcelona', 'Roma', TO_DATE('2026-06-02 09:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-02 11:20', 'YYYY-MM-DD HH24:MI'), 'RETRASADO', 120.00, 2, 3, 2, 4);
INSERT INTO vuelos VALUES (seq_vuelos.NEXTVAL, 'FR3001', 'Madrid', 'Londres', TO_DATE('2026-06-02 13:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-02 15:30', 'YYYY-MM-DD HH24:MI'), 'EMBARCANDO', 80.00, 3, 4, 3, 5);
INSERT INTO vuelos VALUES (seq_vuelos.NEXTVAL, 'FR3002', 'Zaragoza', 'Madrid', TO_DATE('2026-06-03 07:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-03 08:00', 'YYYY-MM-DD HH24:MI'), 'FINALIZADO', 60.00, 3, 5, 3, 5);
INSERT INTO vuelos VALUES (seq_vuelos.NEXTVAL, 'UX4001', 'Madrid', 'Buenos Aires', TO_DATE('2026-06-04 22:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-05 10:30', 'YYYY-MM-DD HH24:MI'), 'PROGRAMADO', 720.00, 4, 6, 4, 7);
INSERT INTO vuelos VALUES (seq_vuelos.NEXTVAL, 'LH5001', 'Madrid', 'Berlín', TO_DATE('2026-06-04 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-04 18:45', 'YYYY-MM-DD HH24:MI'), 'CANCELADO', 180.00, 5, 7, 2, 3);
INSERT INTO vuelos VALUES (seq_vuelos.NEXTVAL, 'LH5002', 'Madrid', 'Múnich', TO_DATE('2026-06-05 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-05 13:35', 'YYYY-MM-DD HH24:MI'), 'PROGRAMADO', 175.00, 5, 8, 4, 8);

INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'PAGADA', 95.50, 1, 1);
INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'PAGADA', 160.00, 2, 2);
INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-03', 'YYYY-MM-DD'), 'ACTIVA', 120.00, 3, 3);
INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-04', 'YYYY-MM-DD'), 'PAGADA', 80.00, 4, 4);
INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-05', 'YYYY-MM-DD'), 'PAGADA', 60.00, 5, 5);
INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-06', 'YYYY-MM-DD'), 'ACTIVA', 720.00, 6, 6);
INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-07', 'YYYY-MM-DD'), 'CANCELADA', 180.00, 7, 7);
INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-08', 'YYYY-MM-DD'), 'PAGADA', 175.00, 8, 8);
INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-09', 'YYYY-MM-DD'), 'ACTIVA', 95.50, 9, 1);
INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-10', 'YYYY-MM-DD'), 'PAGADA', 80.00, 10, 4);
INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-11', 'YYYY-MM-DD'), 'PAGADA', 720.00, 1, 6);
INSERT INTO reservas VALUES (seq_reservas.NEXTVAL, TO_DATE('2026-05-12', 'YYYY-MM-DD'), 'ACTIVA', 120.00, 2, 3);

INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0001', '12A', 'TURISTA', TO_DATE('2026-05-01', 'YYYY-MM-DD'), 1);
INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0002', '08C', 'TURISTA', TO_DATE('2026-05-02', 'YYYY-MM-DD'), 2);
INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0003', '15B', 'TURISTA', TO_DATE('2026-05-03', 'YYYY-MM-DD'), 3);
INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0004', '04A', 'BUSINESS', TO_DATE('2026-05-04', 'YYYY-MM-DD'), 4);
INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0005', '20D', 'TURISTA', TO_DATE('2026-05-05', 'YYYY-MM-DD'), 5);
INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0006', '02A', 'PRIMERA', TO_DATE('2026-05-06', 'YYYY-MM-DD'), 6);
INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0007', '10F', 'TURISTA', TO_DATE('2026-05-07', 'YYYY-MM-DD'), 7);
INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0008', '06B', 'BUSINESS', TO_DATE('2026-05-08', 'YYYY-MM-DD'), 8);
INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0009', '18A', 'TURISTA', TO_DATE('2026-05-09', 'YYYY-MM-DD'), 9);
INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0010', '21C', 'TURISTA', TO_DATE('2026-05-10', 'YYYY-MM-DD'), 10);
INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0011', '01A', 'PRIMERA', TO_DATE('2026-05-11', 'YYYY-MM-DD'), 11);
INSERT INTO billetes VALUES (seq_billetes.NEXTVAL, 'BIL-0012', '16E', 'TURISTA', TO_DATE('2026-05-12', 'YYYY-MM-DD'), 12);

INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 8.50, 'MANO', 'REGISTRADO', 1, 1);
INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 20.00, 'FACTURADO', 'REGISTRADO', 2, 2);
INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 18.75, 'FACTURADO', 'EMBARCADO', 3, 3);
INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 7.20, 'MANO', 'EMBARCADO', 4, 4);
INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 15.00, 'FACTURADO', 'ENTREGADO', 5, 5);
INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 23.50, 'FACTURADO', 'REGISTRADO', 6, 6);
INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 10.00, 'MANO', 'REGISTRADO', 7, 7);
INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 19.30, 'FACTURADO', 'REGISTRADO', 8, 8);
INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 6.80, 'MANO', 'REGISTRADO', 9, 1);
INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 12.40, 'FACTURADO', 'EMBARCADO', 10, 4);
INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 25.00, 'ESPECIAL', 'REGISTRADO', 1, 6);
INSERT INTO equipajes VALUES (seq_equipajes.NEXTVAL, 17.60, 'FACTURADO', 'REGISTRADO', 2, 3);

INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, '11111111A', 'Laura', 'García Pérez', 'SEGURIDAD', 1650.00, TO_DATE('2022-03-10', 'YYYY-MM-DD'), 1);
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, '22222222B', 'Pedro', 'Santos Ruiz', 'FACTURACION', 1500.00, TO_DATE('2021-05-12', 'YYYY-MM-DD'), 1);
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, '33333333C', 'Ana', 'López Martín', 'EMBARQUE', 1550.00, TO_DATE('2023-01-20', 'YYYY-MM-DD'), 2);
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, '44444444D', 'Raúl', 'Navarro Torres', 'MANTENIMIENTO', 1800.00, TO_DATE('2020-11-05', 'YYYY-MM-DD'), 3);
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, '55555555E', 'Carmen', 'Moreno Gil', 'ADMINISTRACION', 1900.00, TO_DATE('2019-09-01', 'YYYY-MM-DD'), 4);
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, '66666666F', 'Luis', 'Vega Romero', 'SEGURIDAD', 1680.00, TO_DATE('2022-07-18', 'YYYY-MM-DD'), 2);
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, '77777777G', 'Marta', 'Castillo León', 'FACTURACION', 1520.00, TO_DATE('2023-04-22', 'YYYY-MM-DD'), 3);
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, '88888888H', 'Sergio', 'Ortega Cano', 'EMBARQUE', 1570.00, TO_DATE('2021-12-02', 'YYYY-MM-DD'), 4);

INSERT INTO turnos_empleados VALUES (seq_turnos.NEXTVAL, TO_DATE('2026-06-01', 'YYYY-MM-DD'), TO_DATE('2026-06-01 06:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-01 14:00', 'YYYY-MM-DD HH24:MI'), 'MANANA', 1);
INSERT INTO turnos_empleados VALUES (seq_turnos.NEXTVAL, TO_DATE('2026-06-01', 'YYYY-MM-DD'), TO_DATE('2026-06-01 14:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-01 22:00', 'YYYY-MM-DD HH24:MI'), 'TARDE', 2);
INSERT INTO turnos_empleados VALUES (seq_turnos.NEXTVAL, TO_DATE('2026-06-01', 'YYYY-MM-DD'), TO_DATE('2026-06-01 22:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-02 06:00', 'YYYY-MM-DD HH24:MI'), 'NOCHE', 3);
INSERT INTO turnos_empleados VALUES (seq_turnos.NEXTVAL, TO_DATE('2026-06-02', 'YYYY-MM-DD'), TO_DATE('2026-06-02 06:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-02 14:00', 'YYYY-MM-DD HH24:MI'), 'MANANA', 4);
INSERT INTO turnos_empleados VALUES (seq_turnos.NEXTVAL, TO_DATE('2026-06-02', 'YYYY-MM-DD'), TO_DATE('2026-06-02 14:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-02 22:00', 'YYYY-MM-DD HH24:MI'), 'TARDE', 5);
INSERT INTO turnos_empleados VALUES (seq_turnos.NEXTVAL, TO_DATE('2026-06-02', 'YYYY-MM-DD'), TO_DATE('2026-06-02 22:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-03 06:00', 'YYYY-MM-DD HH24:MI'), 'NOCHE', 6);
INSERT INTO turnos_empleados VALUES (seq_turnos.NEXTVAL, TO_DATE('2026-06-03', 'YYYY-MM-DD'), TO_DATE('2026-06-03 06:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-03 14:00', 'YYYY-MM-DD HH24:MI'), 'MANANA', 7);
INSERT INTO turnos_empleados VALUES (seq_turnos.NEXTVAL, TO_DATE('2026-06-03', 'YYYY-MM-DD'), TO_DATE('2026-06-03 14:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-06-03 22:00', 'YYYY-MM-DD HH24:MI'), 'TARDE', 8);

COMMIT;


SELECT COUNT(*) FROM aerolineas;
SELECT COUNT(*) FROM vuelos;
SELECT COUNT(*) FROM reservas;