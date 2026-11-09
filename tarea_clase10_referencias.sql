-- 1:1
CREATE TABLE conductores (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	licencia NUMERIC(10,2) UNIQUE NOT NULL,
	fecha_ingreso DATE
);

CREATE TABLE vehiculos (
	id SERIAL PRIMARY KEY,
	patente VARCHAR(10) UNIQUE,
	modelo VARCHAR(10),
	conductor_id INTEGER UNIQUE REFERENCES conductores(id)
);
-- Ejercicio
INSERT INTO conductores (nombre, licencia, fecha_ingreso)
VALUES ('Christian', 37123456, CURRENT_DATE);
-- Ingreso correcto
INSERT INTO conductores (nombre, licencia, fecha_ingreso)
VALUES ('Cacho', 37123456, CURRENT_DATE);
-- ERROR:  duplicate key value violates unique constraint "conductores_licencia_key". Key (licencia)=(37123456.00) already exists.
INSERT INTO conductores (licencia, fecha_ingreso)
VALUES (37123456, CURRENT_DATE);
-- ERROR:  null value in column "nombre" of relation "conductores" violates not-null constraint
SELECT * FROM conductores;

INSERT INTO vehiculos (patente, modelo, conductor_id)
VALUES ('as123df', 'EKwid', 1)
-- Ingreso correcto
SELECT * FROM vehiculos;

INSERT INTO vehiculos (patente, modelo, conductor_id)
VALUES ('as123df', 'Corolla', 1)
--ERROR:  duplicate key value violates unique constraint "vehiculos_patente_key". Key (patente)=(as123df) already exists. 
-- 1:N
CREATE TABLE profesores (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	especialidad VARCHAR(50),
	fecha_contratacion DATE
);

CREATE TABLE clases (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	horario VARCHAR(10),
	profesor_id INTEGER NOT NULL REFERENCES profesores(id)
);
-- Ejercicio
INSERT INTO profesores (nombre, especialidad, fecha_contratacion)
VALUES ('Carlos', 'Biologia', CURRENT_DATE);
-- Ingreso correcto
INSERT INTO profesores (especialidad, fecha_contratacion)
VALUES ('Biologia', CURRENT_DATE);
-- ERROR:  null value in column "nombre" of relation "profesores" violates not-null constraint. Failing row contains (2, null, Biologia, 2026-11-09). 
SELECT * FROM profesores;

INSERT INTO clases (nombre, horario, profesor_id)
VALUES ('Biologia', '9:20am', 1);
-- Ingreso correcto
SELECT * FROM clases;

INSERT INTO clases (horario, profesor_id)
VALUES ('9:20am', 1);
-- ERROR:  null value in column "nombre" of relation "clases" violates not-null constraint
-- N:N
CREATE TABLE pacientes (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	fecha_nacimiento DATE UNIQUE,
	telefono NUMERIC(10,2)
);

CREATE TABLE enfermedades (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(100) NOT NULL,
	nivel_gravedad VARCHAR(10) CHECK(nivel_gravedad = 'leve' OR nivel_gravedad = 'moderada' OR nivel_gravedad = 'grave') NOT NULL
);

CREATE TABLE pacientes_enfermedades (
	paciente_id INTEGER NOT NULL REFERENCES pacientes(id),
	enfermedad_id INTEGER NOT NULL REFERENCES enfermedades(id),
	fecha_diagnostico DATE,
	PRIMARY KEY (paciente_id, enfermedad_id)
);
-- Ejercicio
INSERT INTO pacientes (nombre, fecha_nacimiento, telefono)
VALUES
('Tobias', '1998-05-12', 3794123),
('Pedro', '1995-08-20', 3794234);
-- Ingreso correcto
INSERT INTO enfermedades (nombre, descripcion, nivel_gravedad)
VALUES
('Gripe', 'Infeccion respiratoria', 'leve'),
('Diabetes', 'Enfermedad metabolica', 'grave');
-- Ingreso correcto
SELECT * FROM pacientes;
SELECT * FROM enfermedades;

INSERT INTO pacientes (id, nombre, fecha_nacimiento, telefono)
VALUES (1, 'Juan', '2000-01-15', 3794111);
-- ERROR:  duplicate key value violates unique constraint "pacientes_pkey". Key (id)=(1) already exists.
INSERT INTO pacientes (fecha_nacimiento, telefono)
VALUES ('2001-02-15', 3794111);
-- ERROR:  null value in column "nombre" of relation "pacientes" violates not-null constraint
INSERT INTO enfermedades (id, nombre, descripcion, nivel_gravedad)
VALUES (1, 'Asma', 'Enfermedad respiratoria', 'moderada');
-- ERROR:  duplicate key value violates unique constraint "enfermedades_pkey". Key (id)=(1) already exists.
INSERT INTO enfermedades (nombre, descripcion, nivel_gravedad)
VALUES ('Asma', 'Enfermedad respiratoria', 'critica');
-- ERROR:  new row for relation "enfermedades" violates check constraint "enfermedades_nivel_gravedad_check"
-- Ejercicio creado por Christian M Fages para la tarea 10 sobre referencias en SQL para el Bootcamp 5.0 by Devlights.