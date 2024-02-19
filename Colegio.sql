
CREATE DATABASE  SECTOR_COLEGIO_CHACON_MUNOZ

USE SECTOR_COLEGIO_CHACON_MUNOZ


--Entidad Clase

CREATE TABLE Clase
(
    ID_Clase INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nombre_Clase VARCHAR(30) NOT NULL,
    Nivel_Educativo VARCHAR(50) NOT NULL,
    -- Atributo adicional: Nivel educativo de la clase
    Docente_Responsable VARCHAR(50) NOT NULL,
    -- Atributo adicional: Nombre del docente a cargo de la clase
    Horario_Clase VARCHAR(50) NOT NULL,
    -- Atributo adicional: Horario de la clase
    CONSTRAINT CHK_Nivel_Educativo CHECK (Nivel_Educativo IN ('Primaria', 'Secundaria', 'Bachillerato')),
    -- Restricción por atributo: Solo permite valores específicos
    CONSTRAINT CHK_Horario_Clase CHECK (
        RIGHT(Horario_Clase, 4) <= '1pm'
    )
    -- Restricción por atributo: Horario de clase entre 7am y 1pm
   
);


--Entidad Estudiante

CREATE TABLE Estudiante
(
    ID_Estudiante INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    FechaNacimiento DATE NOT NULL CHECK (YEAR(FechaNacimiento) = 2000),
    TelefonoRepresentante VARCHAR(10) NOT NULL,
    Genero VARCHAR(10) NOT NULL,
    CONSTRAINT CHK_Genero CHECK (Genero IN ('masculino', 'femenino')),
    CONSTRAINT unique_Telefono_Representante UNIQUE (TelefonoRepresentante)
);

CREATE TABLE Tarea (
    ID_Tarea INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1),
    TipoTarea VARCHAR(20) NOT NULL ,
    FechaAsignacion DATE NOT NULL,
    FechaEntrega DATE NOT NULL,
    CONSTRAINT CHK_FechaEntrega CHECK (FechaEntrega > FechaAsignacion),
     CONSTRAINT CHK_TipoTarea CHECK (TipoTarea IN ('Taller', 'Tarea', 'Proyecto')),

);



--registros entidad clase
INSERT INTO Clase (Nombre_Clase, Nivel_Educativo, Docente_Responsable, Horario_Clase)
VALUES 
('Matemáticas', 'Secundaria', 'Profesor García', '7am - 9am'),
('Ciencias', 'Bachillerato', 'Profesora Martínez', '8am - 10am'),
('Historia', 'Secundaria', 'Profesora López', '10am - 12pm'),
('Literatura', 'Bachillerato', 'Profesor Rodríguez', '11am - 1pm'),
('Inglés', 'Primaria', 'Profesora Smith', '7:30am - 12pm');
--registros entidad estudiante
INSERT INTO Estudiante (Nombre, Apellido, FechaNacimiento, TelefonoRepresentante, Genero)
VALUES
('Juan', 'Pérez', '2000-05-15', '1234567890', 'masculino'),
('María', 'González', '2000-08-20', '0987654321', 'femenino'),
('Carlos', 'López', '2000-03-10', '5678901234', 'masculino'),
('Ana', 'Martínez', '2000-11-25', '6789012345', 'femenino'),
('Pedro', 'Sánchez', '2000-09-30', '4567890123', 'masculino');

--registros entidad tarea
INSERT INTO Tarea (TipoTarea, FechaAsignacion, FechaEntrega)
VALUES
('Taller', '2024-02-10', '2024-02-15'),
('Tarea', '2024-02-08', '2024-02-12'),
('Proyecto', '2024-02-05', '2024-02-20'),
('Taller', '2024-02-07', '2024-02-14'),
('Tarea', '2024-02-09', '2024-02-14');

--Consultas 
SELECT * FROM Estudiante 
SELECT * FROM Tarea 
SELECT * FROM Clase 

-- Actualizacion de registros (UPDATE) -> 'Estudiante'
-- Actualizar el teléfono del representante de Juan

UPDATE Estudiante
SET TelefonoRepresentante = '099123456'
WHERE ID_Estudiante = 1;

-- Actualizar el teléfono del representante de Ana
UPDATE Estudiante
SET TelefonoRepresentante = '0917828187'
WHERE ID_Estudiante = 4;

--Actualizacion de datos de entidad->'Tarea'(atributo FechaEntrega)+ una semana
UPDATE Tarea
SET FechaEntrega = DATEADD(WEEK, 1, FechaEntrega)
WHERE TipoTarea = 'Proyecto';




--Eliminacion de registros:
DELETE FROM Estudiante
WHERE Genero = 'femenino';

DELETE FROM Tarea
WHERE FechaAsignacion > '2024-02-10';

DELETE FROM Clase
WHERE Nivel_Educativo = 'Bachillerato';





