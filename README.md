# AerolineaSQL

## Bases de datos - 1º DAW

Este repositorio contiene el desarrollo del **reto final de PL/SQL**, cuyo objetivo es diseñar, implementar y documentar una base de datos completa para un caso de uso real o realista.

El proyecto permite demostrar conocimientos de:

- Modelado Entidad-Relación.
- Modelo relacional.
- Normalización.
- Creación de tablas y restricciones.
- Consultas SQL.
- Procedimientos, funciones y cursores en PL/SQL.
- Triggers.
- Documentación técnica y justificación de decisiones.

---

## Objetivo del proyecto

El objetivo principal es crear una base de datos coherente para un negocio concreto, justificando cada decisión de diseño y aplicando reglas de negocio reales mediante SQL y PL/SQL.

No se trata solo de que el código funcione, sino de que cada tabla, relación, restricción, consulta, procedimiento y trigger tenga sentido dentro del contexto del negocio elegido.

---

## Caso de uso

El caso de uso debe corresponder a una empresa o negocio realista con suficiente complejidad para justificar varias tablas, relaciones y reglas de negocio.

Algunos ejemplos posibles son:

- Clínica veterinaria.
- Academia de idiomas con reserva de clases.
- Tienda online con gestión de stock y pedidos.
- Gimnasio con socios, tarifas y clases.
- Biblioteca con préstamos y reservas.
- Restaurante con carta, reservas y comandas.
- Sistema de turnos para un centro de salud.

---

## Fases del proyecto

### 1. Análisis y modelo relacional

En esta fase se identifican las entidades principales del negocio, sus atributos y las relaciones entre ellas.

Se debe incluir:

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

Se crean las tablas necesarias en Oracle SQL/PLSQL, incluyendo todas las restricciones correspondientes:

- `PRIMARY KEY`
- `FOREIGN KEY`
- `NOT NULL`
- `CHECK`
- `UNIQUE`

También se insertan datos de ejemplo realistas, con un mínimo de 5 a 10 filas por tabla principal.

Los datos deben ser suficientes para que las consultas posteriores devuelvan resultados útiles y significativos.

---

### 3. Consultas SQL

Se incluye una batería de 10 consultas SQL que un usuario real del negocio podría necesitar.

Las consultas deben incluir:

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

Cada consulta debe ir acompañada de un comentario explicando su utilidad dentro del negocio.

---

### 4. PL/SQL: procedimientos, funciones y cursores

Se implementan los siguientes elementos mínimos:

- 2 procedimientos almacenados con parámetros `IN` y/o `OUT`.
- 2 funciones que devuelvan valores calculados útiles para el negocio.
- 1 cursor explícito que recorra registros y ejecute lógica sobre ellos.
- Uso de estructuras de control cuando tengan sentido:
  - `LOOP`
  - `FOR`
  - `WHILE`
  - `IF`
  - `CASE`

---

### 5. Triggers

Se implementan 6 triggers que automaticen reglas de negocio reales.

Algunos ejemplos de uso son:

- Control y actualización automática de stock.
- Auditoría de cambios en tablas críticas.
- Validaciones que no pueden resolverse únicamente con `CHECK`.
- Cálculo automático de totales o campos derivados.

Cada trigger debe incluir una justificación explicando:

- Por qué existe.
- Qué problema de negocio resuelve.
- Qué regla automatiza.

---

## Estructura del repositorio

```text
.
├── crear.sql
├── insertar.sql
├── consultas.sql
├── plsql.sql
├── triggers.sql
└── memoria.pdf
