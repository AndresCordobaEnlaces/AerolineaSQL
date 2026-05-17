--Procedimientos almacenados, funciones, cursores y bloques PL/SQL
-- Funcion que cuenta reservas de un vuelo
CREATE OR REPLACE FUNCTION FN_RESERVAS_VUELO (
    p_id_vuelo IN NUMBER
) RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM RESERVAS
    WHERE ID_VUELO = p_id_vuelo
    AND ESTADO <> 'CANCELADA';

    RETURN v_total;
END;
/

-- Funcion que calcula el peso total del equipaje de un vuelo
CREATE OR REPLACE FUNCTION FN_PESO_VUELO (
    p_id_vuelo IN NUMBER
) RETURN NUMBER
IS
    v_peso NUMBER;
BEGIN
    SELECT NVL(SUM(e.PESO), 0)
    INTO v_peso
    FROM EQUIPAJES e
    JOIN RESERVAS r ON e.ID_RESERVA = r.ID_RESERVA
    WHERE r.ID_VUELO = p_id_vuelo;

    RETURN v_peso;
END;
/

-- Procedimiento que cambia el estado de un vuelo
CREATE OR REPLACE PROCEDURE SP_CAMBIAR_ESTADO (
    p_id_vuelo IN NUMBER,
    p_estado IN VARCHAR2
)
IS
BEGIN
    UPDATE VUELOS
    SET ESTADO = p_estado
    WHERE ID_VUELO = p_id_vuelo;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ese vuelo');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Estado actualizado');
    END IF;
END;
/

-- Procedimiento que muestra los datos de un vuelo
CREATE OR REPLACE PROCEDURE SP_MOSTRAR_VUELO (
    p_id_vuelo IN NUMBER
)
IS
    v_codigo VUELOS.CODIGO_VUELO%TYPE;
    v_origen VUELOS.ORIGEN%TYPE;
    v_destino VUELOS.DESTINO%TYPE;
    v_estado VUELOS.ESTADO%TYPE;
BEGIN
    SELECT CODIGO_VUELO, ORIGEN, DESTINO, ESTADO
    INTO v_codigo, v_origen, v_destino, v_estado
    FROM VUELOS
    WHERE ID_VUELO = p_id_vuelo;

    DBMS_OUTPUT.PUT_LINE('Vuelo: ' || v_codigo);
    DBMS_OUTPUT.PUT_LINE('Ruta: ' || v_origen || ' - ' || v_destino);
    DBMS_OUTPUT.PUT_LINE('Estado: ' || v_estado);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe ese vuelo');
END;
/

-- Cursor explicito para listar los vuelos
DECLARE
    CURSOR c_vuelos IS
        SELECT ID_VUELO, CODIGO_VUELO, ORIGEN, DESTINO, ESTADO
        FROM VUELOS
        ORDER BY ID_VUELO;

    v_id_vuelo VUELOS.ID_VUELO%TYPE;
    v_codigo VUELOS.CODIGO_VUELO%TYPE;
    v_origen VUELOS.ORIGEN%TYPE;
    v_destino VUELOS.DESTINO%TYPE;
    v_estado VUELOS.ESTADO%TYPE;
BEGIN
    OPEN c_vuelos;

    LOOP
        FETCH c_vuelos INTO v_id_vuelo, v_codigo, v_origen, v_destino, v_estado;
        EXIT WHEN c_vuelos%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_codigo || ' | ' ||
            v_origen || ' - ' || v_destino ||
            ' | Estado: ' || v_estado ||
            ' | Reservas: ' || FN_RESERVAS_VUELO(v_id_vuelo) ||
            ' | Equipaje: ' || FN_PESO_VUELO(v_id_vuelo) || ' kg'
        );
    END LOOP;

    CLOSE c_vuelos;
END;
/