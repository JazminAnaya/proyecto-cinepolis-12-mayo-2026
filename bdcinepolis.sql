-- Script de creación de Base de Datos: bdcinepolis.sql
-- Generado para 12 entidades con integridad referencial

CREATE DATABASE IF NOT EXISTS bdcinepolis;
USE bdcinepolis;

-- 1. Entidad COMPLEJO
CREATE TABLE COMPLEJO (
    id_complejo INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(100),
    direccion VARCHAR(255),
    estado VARCHAR(50),
    telefono VARCHAR(20)
);

-- 2. Entidad SALA
CREATE TABLE SALA (
    id_sala INT PRIMARY KEY,
    id_complejo INT,
    nombre VARCHAR(50),
    capacidad INT,
    tipo VARCHAR(50),
    FOREIGN KEY (id_complejo) REFERENCES COMPLEJO(id_complejo)
);

-- 3. Entidad ASIENTO
CREATE TABLE ASIENTO (
    id_asiento INT PRIMARY KEY,
    id_sala INT,
    fila VARCHAR(5),
    numero INT,
    tipo VARCHAR(50),
    disponible BOOLEAN,
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
);

-- 4. Entidad PELICULA
CREATE TABLE PELICULA (
    id_pelicula INT PRIMARY KEY,
    titulo VARCHAR(150),
    clasificacion VARCHAR(10),
    duracion_min INT,
    genero VARCHAR(50),
    idioma VARCHAR(50),
    fecha_estreno DATE,
    director VARCHAR(100)
);

-- 5. Entidad GENERO
CREATE TABLE GENERO (
    id_genero INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- 6. Entidad PELICULA_GENERO (Tabla Intermedia)
CREATE TABLE PELICULA_GENERO (
    id_pelicula INT,
    id_genero INT,
    PRIMARY KEY (id_pelicula, id_genero),
    FOREIGN KEY (id_pelicula) REFERENCES PELICULA(id_pelicula),
    FOREIGN KEY (id_genero) REFERENCES GENERO(id_genero)
);

-- 7. Entidad FUNCION
CREATE TABLE FUNCION (
    id_funcion INT PRIMARY KEY,
    id_sala INT,
    id_pelicula INT,
    fecha_hora DATETIME,
    precio_base DECIMAL(10, 2),
    formato VARCHAR(20),
    estado VARCHAR(20),
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala),
    FOREIGN KEY (id_pelicula) REFERENCES PELICULA(id_pelicula)
);

-- 8. Entidad CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(20),
    fecha_registro DATE,
    puntos_lealtad INT
);

-- 9. Entidad BOLETO
CREATE TABLE BOLETO (
    id_boleto INT PRIMARY KEY,
    id_funcion INT,
    id_cliente INT,
    id_asiento INT,
    precio_final DECIMAL(10, 2),
    tipo_boleto VARCHAR(50),
    fecha_compra DATETIME,
    estado VARCHAR(20),
    FOREIGN KEY (id_funcion) REFERENCES FUNCION(id_funcion),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_asiento) REFERENCES ASIENTO(id_asiento)
);

-- 10. Entidad TRANSACCION
CREATE TABLE TRANSACCION (
    id_transaccion INT PRIMARY KEY,
    id_cliente INT,
    fecha DATETIME,
    monto_total DECIMAL(10, 2),
    metodo_pago VARCHAR(50),
    estado VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

-- 11. Entidad EMPLEADO
CREATE TABLE EMPLEADO (
    id_empleado INT PRIMARY KEY,
    id_complejo INT,
    nombre VARCHAR(100),
    puesto VARCHAR(50),
    turno VARCHAR(50),
    salario DECIMAL(10, 2),
    FOREIGN KEY (id_complejo) REFERENCES COMPLEJO(id_complejo)
);

-- 12. Entidad TURNO
CREATE TABLE TURNO (
    id_turno INT PRIMARY KEY,
    id_empleado INT,
    inicio DATETIME,
    fin DATETIME,
    area VARCHAR(50),
    FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado)
);
