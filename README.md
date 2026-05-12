# AeropuertoSQL

## Bases de datos - 1º DAW

Este repositorio contiene el desarrollo del **reto final de PL/SQL**, cuyo objetivo es diseñar, implementar y documentar una base de datos completa para un caso de uso realista.

El proyecto permite demostrar conocimientos de:

- Modelado Entidad-Relación.
- Modelo relacional.
- Normalización.
- Creación de tablas y restricciones.
- Inserción de datos de ejemplo.
- Consultas SQL.
- Procedimientos, funciones y cursores en PL/SQL.
- Triggers.
- Documentación técnica y justificación de decisiones.

---

## Objetivo del proyecto

El objetivo principal es crear una base de datos coherente para la gestión de un aeropuerto, justificando cada decisión de diseño y aplicando reglas de negocio reales mediante SQL y PL/SQL.

No se trata solo de que el código funcione, sino de que cada tabla, relación, restricción, consulta, procedimiento y trigger tenga sentido dentro del contexto del negocio elegido.

---

## Caso de uso

El caso de uso elegido es la gestión de un **aeropuerto**.

La base de datos permitirá gestionar la información principal relacionada con el funcionamiento de un aeropuerto, incluyendo:

- Aerolíneas.
- Aviones.
- Vuelos.
- Pasajeros.
- Reservas.
- Billetes.
- Equipajes.
- Terminales.
- Puertas de embarque.
- Empleados.
- Turnos de empleados.

Este caso de uso tiene sentido porque un aeropuerto necesita controlar muchos datos relacionados entre sí.

Por ejemplo, un vuelo pertenece a una aerolínea, utiliza un avión, tiene un origen y un destino, sale desde una terminal y una puerta de embarque, y puede tener varios pasajeros asociados mediante reservas y billetes.

Además, existen reglas de negocio que pueden automatizarse con PL/SQL y triggers, como controlar el estado de los vuelos, validar reservas, registrar cambios importantes, controlar el equipaje o evitar conflictos en la asignación de puertas de embarque.

---

## Fases del proyecto

### 1. Análisis y modelo relacional

En esta fase se identifican las entidades principales del aeropuerto, sus atributos y las relaciones entre ellas.

Se incluirá:

- Diagrama Entidad-Relación.
- Traducción al modelo relacional.
- Normalización de las tablas.
- Justificación de las decisiones de diseño:
  - Claves primarias.
  - Relaciones entre tablas.
  - Relaciones N:M.
  - Aplicación de la normalización.

---

### 2. Creación de tablas y datos de ejemplo

Se crearán las tablas necesarias en Oracle SQL/PLSQL, incluyendo todas las restricciones correspondientes:

- `PRIMARY KEY`
- `FOREIGN KEY`
- `NOT NULL`
- `CHECK`
- `UNIQUE`

También se insertarán datos de ejemplo realistas, con un mínimo de 5 a 10 filas por tabla principal.

Los datos serán suficientes para que las consultas posteriores devuelvan resultados útiles y significativos.

---

### 3. Consultas SQL

Se incluirá una batería de 10 consultas SQL que un usuario real del aeropuerto podría necesitar.

Las consultas incluirán:

- `SELECT` con `JOIN`.
- `GROUP BY`.
- `HAVING`.
- Funciones de agregación:
  - `COUNT`
  - `SUM`
  - `AVG`
  - `MAX`
  - `MIN`
- Subconsultas.

Cada consulta irá acompañada de un comentario explicando su utilidad dentro del funcionamiento del aeropuerto.

Ejemplos de consultas posibles:

- Listar vuelos con su aerolínea, avión, terminal y puerta de embarque.
- Mostrar pasajeros de un vuelo concreto.
- Calcular el número de vuelos por aerolínea.
- Obtener el peso medio del equipaje por vuelo.
- Listar vuelos retrasados o cancelados.
- Mostrar empleados asignados a cada turno.
- Calcular el importe total de reservas por vuelo.
- Buscar pasajeros que tengan más de una reserva.
- Mostrar las puertas de embarque más utilizadas.
- Obtener vuelos con más pasajeros que la media.

---

### 4. PL/SQL: procedimientos, funciones y cursores

Se implementarán los siguientes elementos mínimos:

- 2 procedimientos almacenados con parámetros `IN` y/o `OUT`.
- 2 funciones que devuelvan valores calculados útiles para el aeropuerto.
- 1 cursor explícito que recorra registros y ejecute lógica sobre ellos.
- Uso de estructuras de control cuando tengan sentido:
  - `LOOP`
  - `FOR`
  - `WHILE`
  - `IF`
  - `CASE`

Ejemplos de lógica PL/SQL que se podrá implementar:

- Procedimiento para cambiar el estado de un vuelo.
- Procedimiento para asignar una puerta de embarque a un vuelo.
- Función para calcular el número de pasajeros de un vuelo.
- Función para calcular el peso total del equipaje de un pasajero o vuelo.
- Cursor para recorrer los vuelos del día y mostrar su estado.

---

### 5. Triggers

Se implementarán 6 triggers que automaticen reglas de negocio reales dentro del aeropuerto.

Algunos ejemplos de uso son:

- Registrar automáticamente cambios en el estado de un vuelo.
- Evitar que se asignen dos vuelos a la misma puerta a la misma hora.
- Actualizar el estado de una puerta de embarque cuando se le asigna un vuelo.
- Controlar que un billete no pueda emitirse si la reserva está cancelada.
- Registrar auditoría cuando se modifica o cancela un vuelo.
- Validar que el peso del equipaje no supere ciertos límites.

Cada trigger incluirá una justificación explicando:

- Por qué existe.
- Qué problema de negocio resuelve.
- Qué regla automatiza.

---

## Estructura del repositorio

```text
.
├── crear.sql        # Creación de tablas, secuencias y restricciones
├── insertar.sql     # Inserción de datos de ejemplo
├── consultas.sql    # Consultas SQL comentadas
├── plsql.sql        # Procedimientos, funciones, cursores y bloques PL/SQL
├── triggers.sql     # Triggers y justificación de reglas de negocio
└── memoria.pdf      # Memoria del proyecto con modelo E/R y explicación
```

---

## Orden de ejecución

Los ficheros SQL deberán ejecutarse en el siguiente orden sobre una base de datos Oracle limpia:

1. `crear.sql`
2. `insertar.sql`
3. `consultas.sql`
4. `plsql.sql`
5. `triggers.sql`

El fichero `crear.sql` incluirá al inicio los `DROP TABLE` necesarios para poder volver a ejecutar el proyecto sin errores.

---

## Tablas principales previstas

Las tablas principales del proyecto serán:

- `AEROLINEAS`
- `AVIONES`
- `VUELOS`
- `PASAJEROS`
- `RESERVAS`
- `BILLETES`
- `EQUIPAJES`
- `TERMINALES`
- `PUERTAS_EMBARQUE`
- `EMPLEADOS`
- `TURNOS_EMPLEADOS`

Estas tablas podrán ampliarse o ajustarse durante el desarrollo del proyecto si es necesario para mejorar el diseño de la base de datos.

---

## Autor

Proyecto realizado por **Andrés Córdoba** para la asignatura de **Bases de Datos** de **1º DAW**.
